//
//  API.swift
//  RentaTeamTest
//
//  Created by Evian on 11.02.2021.
//

import Foundation

public struct APIConstants {
  
  static let ApiKey = "b9PWugAvqGlyFcBB7et-V6LDYb-Y8lZ61vziN00UbGQ"
  static let countPerRequest = 40 // count of photos per request
  static let baseURL = "https://api.unsplash.com"
  
  static let url = "\(baseURL)/photos/random?&client_id=\(ApiKey)&count=\(String(countPerRequest))"
}
