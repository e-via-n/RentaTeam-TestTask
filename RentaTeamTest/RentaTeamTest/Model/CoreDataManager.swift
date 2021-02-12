//
//  CoreDataManager.swift
//  RentaTeamTest
//
//  Created by Evian on 10.02.2021.
//

import Foundation
import UIKit
import CoreData

public class CoreDataManager: NSObject {
  private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  //save All
  public func save( _ photoDTOs: [PhotoDTO]) {
    for photoDTO in photoDTOs {
      let photo = NSEntityDescription.insertNewObject(forEntityName: "Photo", into: self.context) as! Photo
      photo.updatePhoto(with: photoDTO)
      self.save()
    }
  }
  private func save() {
    do {
      try context.save()
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  //load All
  public func loadAllPhotos() -> [Photo] {
    var arrModel = [Photo]()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Photo")
    do {
      arrModel = try self.context.fetch(fetchRequest) as! [Photo]
    } catch let error {
      print(error.localizedDescription)
    }
    return arrModel
  }
}
