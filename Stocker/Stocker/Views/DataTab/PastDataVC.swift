//
//  PastDataVC.swift
//  Stocker
//
//  Created by koalakid on 2021/01/07.
//

import UIKit

class PastDataVC: UITableViewCell {

    @IBOutlet weak var PDview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        PDview.layer.cornerRadius = 10
        PDview.layer.shadowColor = UIColor.black.cgColor
        PDview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        PDview.layer.shadowOpacity = 0.2
        PDview.layer.shadowRadius = 4.0
        // Configure the view for the selected state
    }

}
