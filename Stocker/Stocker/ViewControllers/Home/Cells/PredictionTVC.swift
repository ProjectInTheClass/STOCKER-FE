import UIKit

class PredictionTVC: UITableViewCell {
//    @IBOutlet weak var stockItemView: UIStackView!
    @IBOutlet weak var temp: PaddingLabel!
    @IBOutlet weak var stockItemButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setContainerStyle()
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        //        stockItemView.addGestureRecognizer(tap)
    }

    
//    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
//        // handling code
//        print("Compoents Tapped")
//    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("buttonTapped !!~~!~!")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
    
    func setContainerStyle(){
//        stockItemButton.layer.zPosition = 5
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
