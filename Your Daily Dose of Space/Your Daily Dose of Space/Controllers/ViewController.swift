//
//  ViewController.swift
//  Your Daily Dose of Space
//
//  Created by Bryan Workman on 6/17/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doseImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDose()
    }
    
    func fetchDose(){
        DoseController.fetchTodaysDose { (dose) in
            guard let dose = dose else {return}
            self.fetchImage(dose: dose)
            
            DispatchQueue.main.async {
                self.titleLabel.text = dose.title
                self.dateLabel.text = dose.date
                self.bodyLabel.text = dose.explanation
            }
        }
        
    }
    
    func fetchImage(dose: Dose) {
        DoseController.fetchTodaysImage(dose: dose) { (image) in
            
            DispatchQueue.main.async {
                self.doseImageView.image = image
                self.view.backgroundColor = UIColor(patternImage: image!)
            }
        }
    }

}

