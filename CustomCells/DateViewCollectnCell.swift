//
//  DateViewCollectnCell.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 12/02/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import UIKit

class DateViewCollectnCell: UICollectionViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        
        self.dateLbl.layer.masksToBounds = true
        self.dateLbl.layer.cornerRadius = 15
    }
    
    override var isSelected: Bool {
        didSet {
            if dateLbl.backgroundColor == UIColor.white{
                
                self.dateLbl.backgroundColor = UIColor.black
                self.dateLbl.textColor = UIColor.orange
                self.dayLbl.textColor = UIColor.orange
                
            }
            else{
                self.dateLbl.backgroundColor = UIColor.white
                self.dateLbl.textColor = UIColor.black
                self.dayLbl.textColor = UIColor.black
                
            }
        }
    }

}
