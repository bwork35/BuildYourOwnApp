//
//  Meme.swift
//  Meme
//
//  Created by Bryan Workman on 6/18/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    let data: SecondLevelDictionary
}

struct SecondLevelDictionary: Codable {
    let memes: [Meme]
}

struct Meme: Codable {
    let url: URL 
}
