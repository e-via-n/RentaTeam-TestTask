//
//  PhotoRequestService.swift
//  RentaTeamTest
//
//  Created by Evian on 10.02.2021.
//

import Foundation
import Moya

enum PhotoRequestService {
  case getRandomPhotos
}

extension PhotoRequestService: TargetType, AccessTokenAuthorizable {
  var baseURL: URL { return URL(string: "https://api.unsplash.com")! }
  var path: String {
    switch self {
    case .getRandomPhotos(let count):
      return "/photos/random\(count)"
    }
  }
  var method: Moya.Method {
    return .get
  }
  var parameters: [String: Any]? {
    switch self {
    case .getRandomPhotos:
      return ["?&client_id=": "5dv52e6eOj5TASiYffjbHF6yTNMLD1Grq4EW6zWacWU", "&count=": 15]
    }
  }
  var authorizationType: AuthorizationType? {
    return .basic
  }
  var parameterEncoding: ParameterEncoding {
    return URLEncoding.default
  }
  var sampleData: Data {
    return Data()
  }
  var headers: [String : String]? {
    return ["Content-type": "application/json"]
  }
  var task: Task {
    return .requestPlain
  }
}
