//
//  HomeViewManager.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/22/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation
import SDWebImage

protocol HomeViewManagerDelegateProtocol: class {
    func didRecieveDate(launches :[Launch])
}

class HomeViewManager {
    
    private let networkManager = NetworkManager.sharedInstance
    weak var delegate: HomeViewManagerDelegateProtocol?
    
    
    /**
     Method to fetch all launches from the space x API
     */
    func fetchAllLaunches()  {
        
        networkManager.fetchLaunchesFrom(url: launchesBaseURL, type: .Past,cache: true, completion: { (response) in
            self.delegate?.didRecieveDate(launches: response)
        })
    }
}
