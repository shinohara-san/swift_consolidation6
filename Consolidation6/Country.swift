//
//  Country.swift
//  Consolidation6
//
//  Created by Yuki Shinohara on 2020/05/28.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation

struct Country: Codable {
    var name: String
    var capital: String
    var region: String
    var population: Int
    var languages: [Language]
    var flag: String
//
    struct Language: Codable {
        var name: String
    }
}



//struct Countries: Codable{
//    var results: [Country]
//}
