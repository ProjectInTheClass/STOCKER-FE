//
//  StarTableViewCell.swift
//  ExForWony
//
//  Created by 정원영 on 2021/01/13.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var bView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        aView.backgroundColor = .black
        bView.backgroundColor = .systemRed
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
