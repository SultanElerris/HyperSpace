//
//  HomeViewCollectionViewCell.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 3/2/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import UIKit

class HomeViewCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var missionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell()
    }
    
    fileprivate func setupCell() {
        mainView.layer.cornerRadius = 5.0
        mainView.layer.shadowRadius = 5.0
        mainView.layer.shadowColor = UIColor.blue.cgColor
    }
    
}
