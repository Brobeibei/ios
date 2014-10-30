//
//  nameCell.swift
//  Cliq-iOS
//
//  Created by Peter Li on 10/31/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import UIKit

class nameCell: UITableViewCell {

    
    @IBOutlet weak var imgUsername: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
