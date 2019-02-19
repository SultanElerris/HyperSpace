//
//  NetworkingManager.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/18/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation

internal let rocketsBaseURL = "https://api.spacexdata.com/v3/rockets" // to get specific rocket append its name. example:/falcon9
internal let dragonBaseURL = "https://api.spacexdata.com/v3/dragons" // to get specific dragon append its name. example:/dragon1
internal let coresBaseURL = "https://api.spacexdata.com/v3/cores" // to get specific core append its name. example:/B1038

internal let roadsterURL = "https://api.spacexdata.com/v3/roadster"

internal let launchesBaseURL = "https://api.spacexdata.com/v3/launches"

public enum LaunchesEndpoint: String {
    // For specfic launch append the number to the end. example: /30
   case Past = "/past"
   case Upcoming = "/upcoming"
   case Latest = "/latest"
   case Next = "/next"
}



