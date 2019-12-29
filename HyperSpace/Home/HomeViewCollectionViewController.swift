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

protocol CellSelectionDelegateProtocol: class {
    func cellSelected(with launch: Launch?)
}

class HomeViewCollectionViewController: UICollectionViewController {
    
    // Cell Selection Delegate
    weak var delegate: CellSelectionDelegateProtocol?
    
    var activityIndecatorView: UIActivityIndicatorView?
    
    // Mark: Properties
    let viewManager = HomeViewManager()
    // Search Controller
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
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
        
        activityIndecatorView = UIActivityIndicatorView(style: .gray)
        self.collectionView.backgroundView = activityIndecatorView
        activityIndecatorView?.hidesWhenStopped = true
        activityIndecatorView?.startAnimating()
        
        
        // Hide Navigation Controller on swipe
        navigationController?.hidesBarsOnSwipe = true
        
        collectionView.backgroundColor = #colorLiteral(red: 0.9338129163, green: 0.9282616973, blue: 0.9380800128, alpha: 1)
        
        // Setup the search bar
        setupSearchBar()

        // Register cell
        let homeViewCollectionViewCell = UINib(nibName: "HomeViewCollectionViewCell", bundle: nil)
        collectionView?.register(homeViewCollectionViewCell, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    fileprivate func setupSearchBar() {
          definesPresentationContext = true
          navigationItem.searchController = searchController
          searchController.obscuresBackgroundDuringPresentation = false
          navigationItem.hidesSearchBarWhenScrolling = false
          searchController.searchBar.delegate = self
          //searchController.searchResultsUpdater = self
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
        
        if let imageURL = self.launches[indexPath.row].links?.missionPatch, let missionLabel = self.launches[indexPath.row].missionName, let launchYear = self.launches[indexPath.row].launchYear {
              cell.missionLabel.text = missionLabel + " " + launchYear            
              cell.imageView?.sd_setImage(with: URL(string: imageURL), completed: nil)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let launchDetailsTableViewController = LaunchDetailsTableViewController()
        //launchDetailsTableViewController.launch = self.launches[indexPath.row]
        delegate?.cellSelected(with: self.launches[indexPath.row])
        navigationController?.present(launchDetailsTableViewController, animated: true, completion: nil)
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


extension HomeViewCollectionViewController: HomeViewManagerDelegateProtocol {
    func didRecieveDate(launches: [Launch]) {
        activityIndecatorView?.stopAnimating()
        self.launches = launches
    }
}

// Mark:- SearchBar Delegate Methods
extension HomeViewCollectionViewController: UISearchBarDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchController.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

