//
//  MemeTableViewCell.swift
//  Meme
//
//  Created by Bryan Workman on 6/18/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
  
    @IBOutlet weak var memeImageView: UIImageView!
    
    
    func updateViews(meme: Meme) {
        
        MemeController.fetchMemeImage(meme: meme) { (result) in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.memeImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
