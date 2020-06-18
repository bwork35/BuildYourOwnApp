//
//  DoseController.swift
//  Your Daily Dose of Space
//
//  Created by Bryan Workman on 6/17/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import Foundation
import UIKit.UIImage

struct StringConstants {
    
    //https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY
    fileprivate static let baseURLString = "https://api.nasa.gov"
    fileprivate static let planetaryComponent = "planetary"
    fileprivate static let apodComponent = "apod"
    fileprivate static let queryItemKey = "api_key"
    fileprivate static let queryItemValue = "DEMO_KEY"
}

class DoseController {
    
    static func fetchTodaysDose(completion: @escaping (Dose?) -> Void) {
        // 1 - URL
        guard let urlWithComponents = URL(string: StringConstants.baseURLString)?.appendingPathComponent(StringConstants.planetaryComponent).appendingPathComponent(StringConstants.apodComponent) else {return completion(nil)}
        
        var urlComponents = URLComponents(url: urlWithComponents, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [URLQueryItem(name: StringConstants.queryItemKey, value: StringConstants.queryItemValue)]
        
        guard let finalURL = urlComponents?.url else {return completion(nil)}
        print(finalURL)
        
        //URL Session - data task
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("there was an error: \(error): \(error.localizedDescription)")
                return completion(nil)
            }
            
            guard let data = data else {return completion(nil)}
            
            do {
                let spaceDose = try JSONDecoder().decode(Dose.self, from: data)
                return completion(spaceDose)
            } catch {
                print(error.localizedDescription)
                return completion(nil)
            }
            
        }.resume()
        
    }
    
    static func fetchTodaysImage(dose: Dose, completion: @escaping (UIImage?) -> Void) {
        let url = dose.url 
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("there was an error: \(error): \(error.localizedDescription)")
                return completion(nil)
            }
            
            guard let data = data else {return completion(nil)}
            
            let image = UIImage(data: data)
            return completion(image)
            
        }.resume()
    }
}
