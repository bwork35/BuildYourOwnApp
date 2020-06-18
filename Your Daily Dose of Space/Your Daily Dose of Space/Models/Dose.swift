//
//  Dose.swift
//  Your Daily Dose of Space
//
//  Created by Bryan Workman on 6/17/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import Foundation

struct Dose: Decodable {
    
    let date: String
    let explanation: String
    let title: String
    let url: URL
    
}
