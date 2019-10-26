//
//  NotificationTableViewCell.swift
//  CodeVar
//
//  Created by Poorna Chandra Vemula on 12/10/19.
//  Copyright © 2019 Tushar Singh. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    //MARK: - IBoutlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}
