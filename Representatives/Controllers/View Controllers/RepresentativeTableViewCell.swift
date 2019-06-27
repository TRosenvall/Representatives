//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Timothy Rosenvall on 6/27/19.
//  Copyright © 2019 Timothy Rosenvall. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    var representative: Representative?{
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    func updateViews () {
        nameLabel.text = representative?.name
        partyLabel.text = representative?.party
        districtLabel.text = representative?.district
        phoneNumberLabel.text = representative?.phone
        linkLabel.text = representative?.link
    }
}
