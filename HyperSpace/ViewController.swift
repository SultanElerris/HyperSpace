//
//  ViewController.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/16/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        networkManager.fetchDataFrom(url: launchesBaseURL, cache: true, completion: { (launches) in
            
            print(launches)
            
        })
        
    }


}

