//
//  MemeError.swift
//  Meme
//
//  Created by Bryan Workman on 6/18/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import Foundation

enum MemeError: LocalizedError {
    case invalidURL
    case noData
    case thrownError(Error)
    case noImageData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "There was an error with the URL."
        case .noData:
            return "There was an error fetching the data."
        case .thrownError(let error):
            return error.localizedDescription
        case .noImageData:
            return "There was an error fetching the image."
        }
    }
}
