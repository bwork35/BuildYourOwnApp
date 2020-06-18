//
//  ErrorAlerts.swift
//  Meme
//
//  Created by Bryan Workman on 6/18/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
    
        let alertController = UIAlertController(title: "Error!", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
    
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true)
    }
}
