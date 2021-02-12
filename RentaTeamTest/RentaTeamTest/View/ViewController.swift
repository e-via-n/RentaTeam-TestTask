//
//  ViewController.swift
//  RentaTeamTest
//
//  Created by Evian on 10.02.2021.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var viewModel: ViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
    
    viewModel.loadAllPhotos {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
    
    viewModel.fetchData {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
}

//MARK: -UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return viewModel.cellForRow(tableView, cellForRowAt: indexPath)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    present(viewModel.detailVC(for: indexPath)!, animated: true, completion: nil)
  }
}

//MARK: -UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    
    if offsetY > contentHeight - scrollView.frame.height {
      viewModel.fetchData {
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
}

