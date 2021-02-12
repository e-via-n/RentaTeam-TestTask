//
//  Photo+MainModel.swift
//  RentaTeamTest
//
//  Created by Evian on 11.02.2021.
//

import Foundation

extension Photo {
  func updatePhoto(with model: PhotoDTO) {
    self.id = model.id
    self.date = Date().string()
    self.imgBlob = model.imgData!
    self.author = model.author
    self.url = model.url
  }
}
