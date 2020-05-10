//
//  SpaceCraftTableViewCell.swift
//  interviewtest
//
//  Created by Terry bu on 5/9/20.
//  Copyright © 2020 Terry Bu. All rights reserved.
//

import UIKit

class SpaceCraftTableViewCell: UITableViewCell {
    
    @IBOutlet var spaceCraftNameLabel: UILabel!
    @IBOutlet var personNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
