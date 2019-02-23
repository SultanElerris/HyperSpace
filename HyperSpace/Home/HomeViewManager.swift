//
//  HomeViewManager.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/22/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation


protocol HomeViewManagerDelegate {
    func didRecieveDate(launches :[Launch])
}

class HomeViewManager {
    
      let networkManager = NetworkManager.sharedInstance
    let delegate: HomeViewManagerDelegate
    
    
    init() {
        
    }
    
    
    func fetchAllLaunches()  {
        networkManager.fetchDataFrom(url: launchesBaseURL, cache: true, completion: { (launches) in
            
            
           self.delegate.didRecieveDate(launches: <#T##[Launch]#>)
            
        })
    }
    
    
    
    
}
