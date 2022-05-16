//
//  Stations.swift
//  SmapleTableView6-29
//
//  Created by zencher on 2020/7/1.
//  Copyright © 2020 zencher. All rights reserved.
//

import Foundation

struct Stations: Decodable {
    
   let isImage: Bool
   let data: [Station]
   let id: String
   let success: Bool
    
    
}
