//
//  Station.swift
//  SmapleTableView6-29
//
//  Created by zencher on 2020/7/1.
//  Copyright © 2020 zencher. All rights reserved.
//

import Foundation

struct Station :Decodable {
    
   let seq: Int
   let 站序, 車站代碼, 車站中文站名, 車站英文站名: String
   let 站位地點: String
   let 備註: 備註
    enum 備註: String, Codable {
        case empty = ""
        case 有電梯 = "有電梯"
    }
}
