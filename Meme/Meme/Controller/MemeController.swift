//
//  MemeController.swift
//  Meme
//
//  Created by Bryan Workman on 6/18/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import Foundation
import UIKit.UIImage

struct StringConstants {
    fileprivate static let baseURLString = "https://api.imgflip.com"
    fileprivate static let memeComponent = "get_memes"
}

class MemeController {
    
    static func fetchMemes(completion: @escaping (Result<[Meme], MemeError>) -> Void) {
        guard let url = URL(string: StringConstants.baseURLString)?.appendingPathComponent(StringConstants.memeComponent) else {return completion(.failure(.invalidURL))}
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let secondLevelDictionary = topLevelDictionary.data
                let memes = secondLevelDictionary.memes
                return completion(.success(memes))
                
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    
    static func fetchMemeImage(meme: Meme, completion: @escaping (Result<UIImage, MemeError>) -> Void) {
        let url = meme.url
        print(url)
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
                
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            guard let image = UIImage(data: data) else {return completion(.failure(.noImageData))}
            
            return completion(.success(image))
            
        }.resume()
        
    }
    
    
    
}
