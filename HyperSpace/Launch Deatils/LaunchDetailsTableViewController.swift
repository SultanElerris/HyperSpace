//
//  LaunchDetailsTableViewController.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 3/3/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import UIKit

class LaunchDetailsTableViewController: UITableViewController {

    var launch: Launch? {
        didSet {
            DispatchQueue.main.async { // Reload table view when the data is fetched.
                self.refershUI()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func refershUI() {
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let homeCell = HomeViewCollectionViewCell()
        print(launch?.missionName ?? "")
        //homeCell.missionLabel.text = launch?.missionName
        return  homeCell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 450
    }

}

extension LaunchDetailsTableViewController: CellSelectionDelegateProtocol {
    func cellSelected(with launch: Launch?) {
        self.launch = launch
    }
}
