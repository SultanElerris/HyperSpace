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
        

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return  HomeViewCollectionViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }

}
