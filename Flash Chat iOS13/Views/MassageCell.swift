//
//  MassageCell.swift
//  Flash Chat iOS13
//
//  Created by Daniel Mayo on 06/06/22.
//  Copyright © 2022 Daniel Mayo. All rights reserved.
//

import UIKit

class MassageCell: UITableViewCell {

    @IBOutlet weak var massageBubble: UIView!
    @IBOutlet weak var rigthImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        massageBubble.layer.cornerRadius = massageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
