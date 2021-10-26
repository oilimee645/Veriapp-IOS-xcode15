//
//  mainTableViewCell.swift
//  VeriApp
//
//  Created by Emilio on 11/08/21.
//

import UIKit

class mainTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var CeldaIndex: Int?
    var selectedCelda: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

     //   contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 3, left: 0, bottom: 3, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        switch CeldaIndex {
           case 0:
               self.cellLabel.text = "Periodo"
                self.cellBackground.layer.style = .none
                self.cellBackground.layer.borderWidth = 2
                self.cellBackground.layer.borderColor = UIColor.black.cgColor
               self.cellBackground.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           case 1:
               self.cellLabel.text = "Enero/Febrero - Julio/Agosto"
            if self.selectedCelda == "5" || self.selectedCelda == "6"{
               self.cellBackground.backgroundColor = #colorLiteral(red: 0.9960784314, green: 0.9333333333, blue: 0, alpha: 1)
            }else{self.cellBackground.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)}
           case 2:
               self.cellLabel.text = "Febrero/Marzo - Agosto/Septiembre"
            if self.selectedCelda == "7" || self.selectedCelda == "8"{
               self.cellBackground.backgroundColor = #colorLiteral(red: 0.8078431373, green: 0.4549019608, blue: 0.4941176471, alpha: 1)
            }else{self.cellBackground.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)}
           case 3:
               self.cellLabel.text = "Marzo/Abril - Septiembre/Octubre"
            if self.selectedCelda == "3" || self.selectedCelda == "4"{
               self.cellBackground.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            }else{self.cellBackground.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)}
           case 4:
               self.cellLabel.text = "Abril/Mayo - Octubre/Noviembre"
            if self.selectedCelda == "1" || self.selectedCelda == "2"{
               self.cellBackground.backgroundColor = #colorLiteral(red: 0.4392156863, green: 0.6588235294, blue: 0.231372549, alpha: 1)
            }else{self.cellBackground.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)}
           case 5:
               self.cellLabel.text = "Mayo/Junio - Noviembre/Diciembre"
            if self.selectedCelda == "9" || self.selectedCelda == "0"{
               self.cellBackground.backgroundColor = #colorLiteral(red: 0, green: 0.6078431373, blue: 0.8588235294, alpha: 1)
            }else{self.cellBackground.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)}
           default:
               return
           }
    
    }

}
