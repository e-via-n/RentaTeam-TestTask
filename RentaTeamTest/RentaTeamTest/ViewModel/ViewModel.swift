//
//  ViewModel.swift
//  RentaTeamTest
//
//  Created by Evian on 10.02.2021.
//

import Foundation
import UIKit

class ViewModel: NSObject {
  
  @IBOutlet weak var dataManager: CoreDataManager!
  @IBOutlet weak var networkManager: NetworkManager!
  
  private var data : [Photo]!
  
  public func loadAllPhotos(completion: @escaping() -> ()) {
    DispatchQueue.global(qos: .userInitiated).async {
      
      self.data = self.dataManager.loadAllPhotos()
      completion()
    }
  }
  
  public func fetchData(completion: @escaping() -> ()) {
    networkManager.fetchData { photos in
      DispatchQueue.global(qos: .userInitiated).async {
        
        self.dataManager.save(photos)
        self.data = self.dataManager.loadAllPhotos()
        
        completion()
      }
    }
  }
}

//MARK: -TableViewDataSource
extension ViewModel {
  func numberOfRowsInSection() -> Int {
    return data?.count ?? 0
  }
  
  func cellForRow(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
    let indexData = data[indexPath .row]
    cell.setupCell(with: indexData)
    return cell
  }
  
  func detailVC(for indexPath: IndexPath) -> DetailViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    let indexData = data[indexPath.row]
    vc.setupVC(with: indexData)
    return vc
  }
}
