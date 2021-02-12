//
//  Extensions.swift
//  RentaTeamTest
//
//  Created by Evian on 12.02.2021.
//

import Foundation

extension Date {
  func string() -> String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM d, yyyy"
      return dateFormatter.string(from: self)
  }
}
