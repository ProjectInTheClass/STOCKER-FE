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
    
    @IBOutlet var paddingCollection1:[PaddingLabel]!
    @IBOutlet var paddingCollection2:[PaddingLabel]!
    @IBOutlet var paddingCollection3:[PaddingLabel]!
    @IBOutlet var paddingCollection4:[PaddingLabel]!
    @IBOutlet var paddingCollection5:[PaddingLabel]!
    
    @IBOutlet weak var contentStack: UIStackView!

    @IBOutlet weak var totalRevenueLabel: PaddingLabel!
    
    var index = 0
    var delegate: DropdownCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        PDview.layer.cornerRadius = 10
        PDview.layer.shadowColor = UIColor.systemGray.cgColor
        PDview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        PDview.layer.shadowOpacity = 0.05
        PDview.layer.shadowRadius = 4.0
        
        for view in OutView {
            view.layer.cornerRadius = 10
            view.layer.shadowColor = UIColor.systemGray.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            view.layer.shadowOpacity = 0.2
            view.layer.shadowRadius = 4.0
        }
        
        let dropdownGesture = UITapGestureRecognizer(target: self, action: #selector(dropdown(_:)))
        contentStack.addGestureRecognizer(dropdownGesture)

        
        // Configure the view for the selected state
    }
    
    @objc func dropdown(_ sender: Any) {
        self.delegate?.selectedInfoBtn(index: index)
    }
}
