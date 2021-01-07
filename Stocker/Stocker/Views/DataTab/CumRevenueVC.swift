//
//  CumRevenueVC.swift
//  Stocker
//
//  Created by koalakid on 2021/01/07.
//

import UIKit

class CumRevenueVC: UITableViewCell {
    
    @IBOutlet weak var CRlabel: UILabel!
    @IBOutlet weak var CRview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        CRlabel.text = "누적 수익률"
        CRview.layer.cornerRadius = 10
        CRview.layer.shadowColor = UIColor.black.cgColor
        CRview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        CRview.layer.shadowOpacity = 0.2
        CRview.layer.shadowRadius = 4.0
        // Configure the view for the selected state
    }

}
