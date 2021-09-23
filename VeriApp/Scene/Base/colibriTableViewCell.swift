//
//  colibriTableViewCell.swift
//  VeriApp
//
//  Created by Admin on 10/09/21.
//

import UIKit

class colibriTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblName.text = "NIL"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
