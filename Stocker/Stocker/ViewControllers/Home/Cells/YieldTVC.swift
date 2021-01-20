//    @IBOutlet weak var cumRevenueView: CumRevenueView!
//    @IBOutlet weak var lastRevenueView: LastRevenueView!

import UIKit

class YieldTVC: UITableViewCell {
    
    @IBOutlet weak var a: UIView!
    @IBOutlet weak var b: UIView!
    @IBOutlet weak var cumRevenueLabel: UILabel!
    @IBOutlet weak var lastRevenueLabel: UILabel!
    
    var revenue : [Float] = [] {
        didSet{
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        RevenueAPI.shared.getRevenueData(completion: { result in
            switch result {
            case .success(let _revenue):
                self.cumRevenueLabel.text =
                    String(_revenue.cumRevenue)
                self.lastRevenueLabel.text = String(_revenue.lastRevenue)
                
                self.revenue.append(_revenue.cumRevenue)
                self.revenue.append(_revenue.lastRevenue)
                print("revenue : \(self.revenue)")
            case .failure(let error):
                print(error)
            }
        })
        
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
