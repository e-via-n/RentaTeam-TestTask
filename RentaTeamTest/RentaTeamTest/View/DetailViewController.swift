//
//  DetailViewController.swift
//  RentaTeamTest
//
//  Created by Evian on 11.02.2021.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var photoView: UIImageView!
  @IBOutlet weak var urlLabel: UILabel!
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  private var photo: Photo!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    dateLabel.text = photo.date
    photoView.image = UIImage(data: photo.imgBlob!)
    urlLabel.text = photo.url
    idLabel.text = photo.id
    authorLabel.text = photo.author
    }
  
  public func setupVC(with photo: Photo) {
    self.photo = photo
  }
}
