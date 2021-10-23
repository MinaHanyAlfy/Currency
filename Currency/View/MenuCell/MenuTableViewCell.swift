//
//  MenuTableViewCell.swift
//  Currency
//
//  Created by John Doe on 2021-10-23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    let titles = ["العملات المحليه","الدردشه"," المحروقات","الشاشه العالمية","الاخبار","محول العملات","سياسة الخصوصيه"]
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear.withAlphaComponent(0)
        // Initialization code
    }

    @IBOutlet weak var titleLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellFill(index:Int){
        titleLabel.text = titles[index]
    }
    
}
