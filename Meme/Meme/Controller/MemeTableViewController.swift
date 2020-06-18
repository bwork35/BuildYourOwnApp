//
//  MemeTableViewController.swift
//  Meme
//
//  Created by Bryan Workman on 6/18/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getMemes()
    }

    var memes: [Meme] = []
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell", for: indexPath) as? MemeTableViewCell else {return UITableViewCell()}

        let meme = memes[indexPath.row]
        cell.updateViews(meme: meme)

        return cell
    }
    
    func getMemes(){
        
        MemeController.fetchMemes { (result) in
            switch result {
            case .success(let memes):
                self.memes = memes
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.presentErrorToUser(localizedError: error)
                print(error)
            }
        }
    }
    

}
