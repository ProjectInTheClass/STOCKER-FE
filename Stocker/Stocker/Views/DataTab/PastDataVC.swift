//
//  PastDataVC.swift
//  Stocker
//
//  Created by koalakid on 2021/01/07.
//

import UIKit

protocol DropdownCellDelegate {
    func selectedInfoBtn(index: Int)
}

class PastDataVC: UITableViewCell {

    @IBOutlet weak var PDview: UIView!
    @IBOutlet var OutView: [UIView]!
    @IBOutlet weak var weekLabel: UILabel!
    
    @IBOutlet var stockCollection1: [UILabel]!
    @IBOutlet var stockCollection2: [UILabel]!
    @IBOutlet var stockCollection3: [UILabel]!
    @IBOutlet var stockCollection4: [UILabel]!
    @IBOutlet var stockCollection5: [UILabel]!
    @IBOutlet weak var contentStack: UIStackView!
    @IBOutlet weak var dropdownButton: UIButton!
    
    var index = 0
    var delegate: DropdownCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var bottom: NSLayoutConstraint!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        PDview.layer.cornerRadius = 10
        PDview.layer.shadowColor = UIColor.black.cgColor
        PDview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        PDview.layer.shadowOpacity = 0.2
        PDview.layer.shadowRadius = 4.0
        
        for view in OutView {
            view.layer.cornerRadius = 10
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            view.layer.shadowOpacity = 0.2
            view.layer.shadowRadius = 4.0
        }
        // Configure the view for the selected state
    }
    
    @IBAction func dropdown(_ sender: Any) {
        self.delegate?.selectedInfoBtn(index: index)
    }
}
