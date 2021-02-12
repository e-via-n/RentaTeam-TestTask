//
//  NetworkManager.swift
//  RentaTeamTest
//
//  Created by Evian on 10.02.2021.
//

import Foundation
import Alamofire

//MARK: -NetworkManager
public class NetworkManager: NSObject {
  private var isFetching = false
  
  public func fetchData(completion: @escaping([PhotoDTO]) -> ()) {
    guard isFetching == false else { return }
    isFetching = true
    
    AF.request(APIConstants.url).responseJSON { (response) in
      switch response.result {
      case .success:
        NSLog("Request is success")
        
        DispatchQueue.global().async {
          completion(self.parseData(anyData: response.value!))
        }
        
      case .failure(let error):
        NSLog("\(error.localizedDescription)")
      }
    }
  }
  
  private func parseData(anyData: Any) -> [PhotoDTO] {
    guard let dict = anyData as? [Dictionary<String, AnyObject>] else {
      return [] }
    var photoArr : [PhotoDTO] = []
    
    for item in dict {
      let photo = PhotoDTO(dict: item)
      photoArr.append(photo)
    }
    isFetching = false
    return photoArr
  }
}
