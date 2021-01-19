import UIKit

protocol ComponentProductCellDelegate {
    func touchUpInside(index: Int)
}

class PredictionTVC: UITableViewCell {
//    @IBOutlet weak var stockItemView: UIStackView!
    @IBOutlet weak var temp: PaddingLabel!
    @IBOutlet weak var stockItemButton: UIButton!
    @IBOutlet weak var component: UIView!
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var chartViewHeightConstraint: NSLayoutConstraint!
    
    var index: Int = 0
    var delegate: ComponentProductCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stockItemButton.setBackgroundColor(#colorLiteral(red: 0.9229881167, green: 0.9229881167, blue: 0.9229881167, alpha: 1), for: .highlighted)
        tempView.layer.zPosition = -1
        tempView.isHidden = true
        tempView.alpha = 0
        chartViewHeightConstraint.constant = 0
        
        setContainerStyle()
    }

    @IBAction func touchUpoutside(_ sender: UIButton) {
//        sender.alpha = 0.05
    }
    
    @IBAction func touchDown(_ sender: UIButton) {
//        sender.alpha = 0.5
    }
    
    @IBAction func touchUpInside(_ sender: UIButton) {
//        sender.alpha = 0.5
         
//        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
//            self.tempView.isHidden = !self.tempView.isHidden
//            self.tempView.alpha = self.tempView.alpha == 0 ? 1 : 0
//
//        }, completion: nil)
        
        self.delegate?.touchUpInside(index: self.index)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setContainerStyle(){
        component.layer.cornerRadius = 10
        component.layer.shadowOpacity = 0.1
        component.layer.shadowOffset = CGSize(width: 1, height: 1)
        component.layer.shadowRadius = 10
        component.layer.masksToBounds = true
        
        stockItemButton.layer.shadowOpacity = 0.1
        stockItemButton.layer.masksToBounds = true
        
        temp.backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 5
//        container.layer.cornerRadius = 10
//        container.layer.shadowOpacity = 0.1
//        container.layer.shadowOffset = CGSize(width: 1, height: 1)
//        container.layer.shadowRadius = 10
//        container.layer.masksToBounds = false
    }
}
