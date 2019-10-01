//
//  LaunchDetailsTableViewController.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 3/3/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import UIKit

class LaunchDetailsTableViewController: UITableViewController {

    
    var flightNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(flightNumber)
        
        
        let url = "https://api.spacexdata.com/v3/launches/\(flightNumber)"
        
        networkManager.fetchDictFrom(url: url, cache: true, completion: { (response) in
            // Serialize our response to a json format so we can decode it later
            guard  let jsonData = try? JSONSerialization.data(withJSONObject:response) else { return}
            
            do {
                let jsonDecoder = JSONDecoder()
                let lunch = try jsonDecoder.decode(Launch.self, from: jsonData)
                
                print(lunch)
            } catch { /* Report the decoding error */ print("can't decode lunches json data",error) }
        })

    }
    
    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return  HomeViewCollectionViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }

}
