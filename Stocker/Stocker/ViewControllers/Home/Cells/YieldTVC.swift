//    @IBOutlet weak var cumRevenueView: CumRevenueView!
//    @IBOutlet weak var lastRevenueView: LastRevenueView!

import UIKit

class YieldTVC: UITableViewCell {
    
    @IBOutlet weak var a: UIView!
    @IBOutlet weak var b: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setCustomViewStyles()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
 
    func setCustomViewStyles() {
        a.layer.cornerRadius = 10
        a.layer.shadowOpacity = 0.1
        a.layer.shadowOffset = CGSize(width: 1, height: 1)
        a.layer.shadowRadius = 10
        a.layer.masksToBounds = false
    
        b.layer.cornerRadius = 10
        b.layer.shadowOpacity = 0.1
        b.layer.shadowOffset = CGSize(width: 1, height: 1)
        b.layer.shadowRadius = 10
        b.layer.masksToBounds = false
    }
    
}
