//
//  Launches.swift
//  HyperSpace
//
//  Created by Sultan Sultan on 2/22/19.
//  Copyright © 2019 Sultan Sultan. All rights reserved.
//

import Foundation


struct Launch: Decodable {
    let flight_number: Int
    let launch_date_local: String
    
}


//{
//    "flight_number": 1,
//    "mission_name": "FalconSat",
//    "mission_id": [],
//    "upcoming": false,
//    "launch_year": "2006",
//    "launch_date_unix": 1143239400,
//    "launch_date_utc": "2006-03-24T22:30:00.000Z",
//    "launch_date_local": "2006-03-25T10:30:00+12:00",
//    "is_tentative": false,
//    "tentative_max_precision": "hour",
//    "tbd": false,
//    "launch_window": 0,
//    "rocket": {
//        "rocket_id": "falcon1",
//        "rocket_name": "Falcon 1",
//        "rocket_type": "Merlin A",
//        "first_stage": {
//            "cores": [
//            {
//            "core_serial": "Merlin1A",
//            "flight": 1,
//            "block": null,
//            "gridfins": false,
//            "legs": false,
//            "reused": false,
//            "land_success": null,
//            "landing_intent": false,
//            "landing_type": null,
//            "landing_vehicle": null
//            }
//            ]
//        },
//        "second_stage": {
//            "block": 1,
//            "payloads": [
//            {
//            "payload_id": "FalconSAT-2",
//            "norad_id": [],
//            "reused": false,
//            "customers": [
//            "DARPA"
//            ],
//            "nationality": "United States",
//            "manufacturer": "SSTL",
//            "payload_type": "Satellite",
//            "payload_mass_kg": 20,
//            "payload_mass_lbs": 43,
//            "orbit": "LEO",
//            "orbit_params": {
//            "reference_system": "geocentric",
//            "regime": "low-earth",
//            "longitude": null,
//            "semi_major_axis_km": null,
//            "eccentricity": null,
//            "periapsis_km": 400,
//            "apoapsis_km": 500,
//            "inclination_deg": 39,
//            "period_min": null,
//            "lifespan_years": null,
//            "epoch": null,
//            "mean_motion": null,
//            "raan": null,
//            "arg_of_pericenter": null,
//            "mean_anomaly": null
//            }
//            }
//            ]
//        },
//        "fairings": {
//            "reused": false,
//            "recovery_attempt": false,
//            "recovered": false,
//            "ship": null
//        }
//}
