//
//  HomeViewManager.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/22/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation

class HomeViewManager {
    
    let networkManager = NetworkManager.sharedInstance
    weak var delegate: HomeViewManagerDelegate?
    
    
    func fetchAllLaunches()  {
        
        networkManager.fetchDataFrom(url: launchesBaseURL, cache: true, completion: { (response) in
        // Serialize our response to a json format so we can decode it later
        guard  let jsonData = try? JSONSerialization.data(withJSONObject:response) else { return}
            
        do {
            let jsonDecoder = JSONDecoder()
            let lunches = try jsonDecoder.decode([Launch].self, from: jsonData)

            self.delegate?.didRecieveDate(launches: lunches)
        } catch { /* Report the decoding error */ print("can't decode lunches json data",error) }
        })
    }
    
    
}
