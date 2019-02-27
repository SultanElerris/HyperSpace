//
//  HomeViewManager.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/22/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation


protocol HomeViewManagerDelegate {
    func didRecieveDate(launches :[[Launch]])
}

class HomeViewManager {
    
      let networkManager = NetworkManager.sharedInstance
    
    
    init() {
        
    }
    
    
    func fetchAllLaunches()  {
        
        networkManager.fetchDataFrom(url: launchesBaseURL, cache: true, completion: { (launches) in
        
        guard  let jsonData = try? JSONSerialization.data(withJSONObject:launches) else {
            return
        }
            
        do {
            let jsonDecoder = JSONDecoder()
            let mylunch = try jsonDecoder.decode(Launch.self, from: jsonData)
            
        } catch { /* Report the error */ print(error) }
        })
    }
    
    
    
    
}
