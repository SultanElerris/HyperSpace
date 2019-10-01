//
//  HomeViewCollectionViewController.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/22/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "HomeCell"
 let networkManager = NetworkManager.sharedInstance

class HomeViewCollectionViewController: UICollectionViewController {
    
    // Mark: Properties
    let viewManager = HomeViewManager()
    var launches: [Launch] = [] {
        didSet {
             self.collectionView.reloadData()
        }
    }
    
    // Var to hold the cell frame. We will need this when we animate the cell to a new view and when we go animate back
    var cellFrame: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewManager.delegate = self
        viewManager.fetchAllLaunches()
        
        
        // Hide Navigation Controller on swipe
        navigationController?.hidesBarsOnSwipe = true
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9338129163, green: 0.9282616973, blue: 0.9380800128, alpha: 1)

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
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        collectionView?.collectionViewLayout.invalidateLayout()
        switch UIApplication.shared.statusBarOrientation {
           
        case .unknown:
            print("unknown:")
        case .portrait:
            print("portriat")
        case .portraitUpsideDown:
            print("portraitUpsideDown")
        case .landscapeLeft:
            print("Landscape")
        case .landscapeRight:
            print("landscapeRight")
        }
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
        cell.missionLabel.text =  ("\(self.launches[indexPath.row].missionName)")
        
        if let imageURL = self.launches[indexPath.row].links.missionPatch {

              cell.imageView?.sd_setImage(with: URL(string: imageURL), completed: nil)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let launchDetailsTableViewController = LaunchDetailsTableViewController()
        launchDetailsTableViewController.flightNumber = self.launches[indexPath.row].flightNumber
        
        navigationController?.present(launchDetailsTableViewController, animated: true, completion: nil)
    }
    
    @objc func handleRemoveView(gesture :UITapGestureRecognizer) {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
                
                // Get back to normal location
                self.navigationController?.navigationBar.transform = .identity; self.tabBarController?.tabBar.transform = .identity

                guard let cellFrame = self.cellFrame else {
                    print("Couldn't get the cell frame")
                    return
                }
                gesture.view?.frame = cellFrame
            }, completion: { _ in
                gesture.view?.removeFromSuperview()
            })

        
    }
}

/// MARK: UICollectionViewDelegateFlowLayout
extension HomeViewCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 20, height: 129.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5.0, left: 0.0, bottom: 5.0, right: 0.0)
    }
}



extension HomeViewCollectionViewController: HomeViewManagerDelegate {
    func didRecieveDate(launches: [Launch]) {
        self.launches = launches
    }
}
