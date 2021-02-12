//
//  PhotoCell.swift
//  RentaTeamTest
//
//  Created by Evian on 10.02.2021.
//

import UIKit

class PhotoCell: UITableViewCell {
  
  @IBOutlet weak var photoView: UIImageView!
  @IBOutlet weak var idLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  public func setupCell(with photo: Photo) {
    DispatchQueue.global(qos: .userInteractive).async {
      let image = UIImage(data: photo.imgBlob!)
      DispatchQueue.main.async {
        self.photoView.image = image
        self.idLabel.text = photo.id
      }
    }
  }
}
