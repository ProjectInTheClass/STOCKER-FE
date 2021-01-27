//
//  PredictionTitleTVC.swift
//  Stocker
//
//  Created by 정원영 on 2021/01/18.
//

import UIKit

protocol PredictionTitleTVCDelegate {
    func openGuideAlert()
}

class PredictionTitleTVC: UITableViewCell {
    @IBOutlet weak var guideButton: UIButton!
    
    var index: Int = 0
    var delegate : PredictionTitleTVCDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openGuideAlert(_ sender: UIButton) {
        self.delegate?.openGuideAlert()
    }
}
