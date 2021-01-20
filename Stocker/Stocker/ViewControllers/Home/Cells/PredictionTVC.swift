import UIKit
import Charts
import Alamofire

protocol ComponentProductCellDelegate {
    func touchUpInside(index: Int)
}

class PredictionTVC: UITableViewCell {
//    @IBOutlet weak var stockItemView: UIStackView!
    @IBOutlet weak var temp: PaddingLabel!
    @IBOutlet weak var stockItemButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var component: UIView!
    @IBOutlet weak var stockerChartView: StockerChartView!
    @IBOutlet weak var chartViewHeightConstraint: NSLayoutConstraint!
    
    var index: Int = 0
    var delegate: ComponentProductCellDelegate?
    
    var chartDataEntry : [ChartDataEntry] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //API Code
        RevenueAPI.shared.getRevenueData(completion: { result in
            switch result {
            case .success(let data):
                print("data.stockList : \(data.stockList)")
            case .failure(let error):
                print(error)
            }
        })
    
        stockItemButton.setBackgroundColor(#colorLiteral(red: 0.9229881167, green: 0.9229881167, blue: 0.9229881167, alpha: 1), for: .highlighted)
        
        
//        stockerChartView.isHidden = true
//        stockerChartView.alpha = 0
        
        //Setting Chart View
        stockerChartView.removeFromSuperview()
        stockerChartView.setUp(yValues)
        
        //Setting Style
        setContainerStyle()
    }
    
    @IBAction func touchUpInside(_ sender: UIButton) {
        stackView.addArrangedSubview(self.stockerChartView)
//        sender.alpha = 0.5
//        self.stockerChartView.isHidden = !self.stockerChartView.isHidden
//        self.stockerChartView.alpha = self.stockerChartView.alpha == 0 ? 1 : 0
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
    }
    
    @IBAction func touchUpoutside(_ sender: UIButton) {
//        sender.alpha = 0.05
    }
    
    @IBAction func touchDown(_ sender: UIButton) {
//        sender.alpha = 0.5
    }
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 10.0),
        ChartDataEntry(x: 1.0, y: 5.0),
        ChartDataEntry(x: 2.0, y: 7.0),
        ChartDataEntry(x: 3.0, y: 15.0),
        ChartDataEntry(x: 4.0, y: 10.0),
        ChartDataEntry(x: 5.0, y: 6.0),
        ChartDataEntry(x: 6.0, y: 4.0),
        ChartDataEntry(x: 7.0, y: 7.0),
        ChartDataEntry(x: 8.0, y: 8.0),
        ChartDataEntry(x: 9.0, y: 3.0),
        ChartDataEntry(x: 10.0, y: 7.0),
    ]
}
