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
   case Past = "/past" // An array of past launches
   case Upcoming = "/upcoming" // An array of upcoming launches
   case Latest = "/latest" // Latest launch
   case Next = "/next" // Next launch
}

class NetworkManager {
    
    // MARK: - Properties
    static let sharedInstance = NetworkManager()
    
    /** Generic Method to fetch data from Almofire
     - Parameter url: String
     - Parametor cache: Bool
     - Return result
     */
    func fetchLaunchesFrom(url: String?, type: LaunchesEndpoint?, cache: Bool, completion: @escaping ([Launch]) -> Void) {
           
           // No URL, no point of proceeding so early exit
           guard let url = url, let type = type else {
               return
           }
        
        let finalURL = url + type.rawValue
        
           // Request data from Almo
           AF.request(finalURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
               
               switch response.result {
               case .success(let payload):
                   do {
                       let launchesArray = try JSONDecoder().decode([Launch].self, from: payload)
                    completion(launchesArray.reversed())
                   } catch let error {
                       print("Parsing failed with error: \(error)")
                   }
               case .failure(let error):
                   print("Request failed with error: \(error)")
               }
           }
       }
    
/** Generic Method to fetch data from Almofire
 - Parameter url: String
 - Parametor cache: Bool
 - Return result
 */
func fetchLaunchFrom(url: String?, cache: Bool, completion: @escaping (Launch) -> Void) {
       
       // No URL, no point of proceeding so early exit
       guard let url = url else{
           return
       }
       // Request data from Almo
       AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData { (response) in
           
           switch response.result {
           case .success(let payload):
               do {
                   let launch = try JSONDecoder().decode(Launch.self, from: payload)
                   completion(launch)
               } catch let error {
                   print("Parsing failed with error: \(error)")
               }
           case .failure(let error):
               print("Request failed with error: \(error)")
           }
       }
   }
}


