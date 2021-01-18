//
//  CumRevenueVC.swift
//  Stocker
//
//  Created by koalakid on 2021/01/07.
//

import UIKit

class HeaderVC: UITableViewCell {
    
    @IBOutlet weak var Hlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        Hlabel.text = "지난 한달간 데이터"
        // Configure the view for the selected state
    }

}
