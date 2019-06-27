//
//  Representative.swift
//  Representatives
//
//  Created by Timothy Rosenvall on 6/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import Foundation

struct TopLevelJSON: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    
    let name: String
    let party: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
}
