//
//  MainModel.swift
//  RentaTeamTest
//
//  Created by Evian on 10.02.2021.
//

import Foundation
import UIKit
import SwiftyJSON

public class PhotoDTO {
  var id: String?
  var url: String?
  var date: Date?
  var author: String?
  var imgData: Data?
  
  init(dict: Dictionary<String, AnyObject>) {
    let json = JSON(dict)
    
    self.id = json["id"].string
    self.url = json["urls"]["small"].string
    self.author = json["user"]["name"].string
    self.imgData = downloadImage(url: url!)
  }
  
  private func downloadImage(url: String) -> Data {
    let url = URL.init(string: url)
    guard let imageData = try? Data(contentsOf: url!) else { return Data() }
    return imageData
  }
}

