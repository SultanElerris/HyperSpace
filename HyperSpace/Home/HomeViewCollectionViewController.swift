//
//  HomeViewCollectionViewController.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/22/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeCell"

protocol HomeViewManagerDelegate: class {
    func didRecieveDate(launches :[Launch])
}


class HomeViewCollectionViewController: UICollectionViewController {
    
    // Mark: Properties 
    let viewManager = HomeViewManager()
    var launches: [Launch] = [] {
        didSet {
             self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewManager.delegate = self
        viewManager.fetchAllLaunches()
        
        collectionView.backgroundColor = .lightGray

        // Register cell
        let homeViewCollectionViewCell = UINib(nibName: "HomeViewCollectionViewCell", bundle: nil)
        collectionView?.register(homeViewCollectionViewCell, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

/// MARK: UICollectionViewDataSource
extension  HomeViewCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.launches.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HomeViewCollectionViewCell
        cell.missionLabel.text = self.launches[indexPath.row].missionName
        return cell
    }
}

/// MARK: UICollectionViewDelegateFlowLayout
extension HomeViewCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 200.0)
    }
}


extension HomeViewCollectionViewController: HomeViewManagerDelegate {
    func didRecieveDate(launches: [Launch]) {
        self.launches = launches
    }
}
