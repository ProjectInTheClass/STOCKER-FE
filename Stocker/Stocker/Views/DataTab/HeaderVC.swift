//
//  CumRevenueVC.swift
//  Stocker
//
//  Created by koalakid on 2021/01/07.
//

import UIKit

class HeaderVC: UITableViewCell {
    
    @IBOutlet weak var chartImageView: UIImageView!
    @IBOutlet weak var HeaderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        chartImageView.image = UIImage(named: "chart")
        
        HeaderView.layer.cornerRadius = 10
        HeaderView.layer.shadowColor =  UIColor.black.cgColor
        HeaderView.layer.shadowOpacity = 0.2
        HeaderView.layer.shadowOffset = CGSize(width: 0.1, height: 1.0)
        HeaderView.layer.shadowRadius = 4.0
        HeaderView.layer.masksToBounds = false
        // Configure the view for the selected state
    }

}
