//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Timothy Rosenvall on 6/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        cell.textLabel?.text = States.all[indexPath.row]
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Identifier
        if segue.identifier == "toDetailView" {
            //Index and Destination
            guard let indexPath = tableView.indexPathForSelectedRow, let destinationVC = segue.destination as?  StateDetailTableViewController else {return}
            //Object to Set
            destinationVC.state = States.all[indexPath.row]
        }
    }
}
