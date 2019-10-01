//
//  NetworkingManager.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/18/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation
import Alamofire

/// Base URLS
internal let rocketsBaseURL = "https://api.spacexdata.com/v3/rockets" // to get specific rocket append its name. example:/falcon9
internal let dragonBaseURL = "https://api.spacexdata.com/v3/dragons" // to get specific dragon append its name. example:/dragon1
internal let coresBaseURL = "https://api.spacexdata.com/v3/cores" // to get specific core append its name. example:/B1038
internal let roadsterURL = "https://api.spacexdata.com/v3/roadster"
internal let launchesBaseURL = "https://api.spacexdata.com/v3/launches"

/// Launches Endpoints
public enum LaunchesEndpoint: String {
    // For specfic launch append the number to the end. example: /30
   case Past = "/past"
   case Upcoming = "/upcoming"
   case Latest = "/latest"
   case Next = "/next"
}

class NetworkManager {
    
    // MARK: - Properties
    static let sharedInstance = NetworkManager()
    
    /** Generic Method to fetch data from Almofire
     - Parameter url: String
     - Parametor cache: Bool
     - Return result
     */
    func fetchDataFrom(url: String?, cache: Bool, completion: @escaping (Any) -> Void)  {
        
        // No URL, no point of proceeding so early exit
        guard let url = url else{
            return
        }
        // Request data from Almo
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response  in
            
            switch response.result {
            case .success(let payload):
                guard let jsonArray = payload as? [Any] else { return }
                completion(jsonArray)
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
    
    func fetchDictFrom(url: String?, cache: Bool, completion: @escaping (Any) -> Void)  {
        
        // No URL, no point of proceeding so early exit
        guard let url = url else{
            return
        }
        // Request data from Almo
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response  in
            
            switch response.result {
            case .success(let payload):
                guard let jsonArray = payload as? [String: Any] else { return }
                completion(jsonArray)
            case .failure(let error):
                print("Request failed with error: \(error)")
            }
        }
    }
}


