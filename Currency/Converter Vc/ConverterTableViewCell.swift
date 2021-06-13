//
//  ConverterTableViewCell.swift
//  Currency
//
//  Created by Mina Hany on 5/23/21.
//

import UIKit

class ConverterTableViewCell: UITableViewCell {
    @IBOutlet weak var priceLBL: UILabel!
    
    @IBOutlet weak var titleLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
  
    func fillData(index:Int) {
        titleLBL.text = "EURO"
        priceLBL.text = "22.8"
        if (index % 2 == 0){
            self.contentView.backgroundColor = UIColor.white
        }
        else {
            self.contentView.backgroundColor = UIColor.systemGray6
        }
    }
}
