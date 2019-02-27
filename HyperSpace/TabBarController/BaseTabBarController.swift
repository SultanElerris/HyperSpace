//
//  BaseTabBarController.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/27/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation
import UIKit

enum TabBarTitle: String {
    
    case lunches = "Lanches"
}

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tab bar customization
        tabBarCustimization()
        
        // Array of view Controllers the tab bar will show ...
        viewControllers = [
            createNavController(viewController: HomeViewCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), title: TabBarTitle.lunches.rawValue, imageNamge: "")
        ]
    }
    
    /*
     Helper method that create a navigationViewController
     - Parameter viewController: UIViewController
     - Parameter title : String
     - Parameter imageName: String
    */
    fileprivate func createNavController(viewController: UIViewController, title: String , imageNamge: String) -> UIViewController {
        viewController.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageNamge)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    
    /*
     Method to custimize our tab bar
     */
    fileprivate func tabBarCustimization() {
        tabBar.tintColor = .white
        tabBar.barTintColor = .black
    }

}
