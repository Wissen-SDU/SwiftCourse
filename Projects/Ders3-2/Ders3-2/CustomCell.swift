//
//  CustomCell.swift
//  Ders3-2
//
//  Created by Suleyman Calik on 26.11.2014.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var lblTitle:UILabel!
    @IBOutlet var onOffSwitch:UISwitch!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
