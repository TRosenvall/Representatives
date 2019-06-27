//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Timothy Rosenvall on 6/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    
    var representatives: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else {return}
        RepresentativeController.searchRepresentatives(forState: state) { (representatives) in
            self.representatives = representatives
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? RepresentativeTableViewCell else {return UITableViewCell()}
        let representative = representatives[indexPath.row]
        cell.representative = representative
        return cell
    }
}
