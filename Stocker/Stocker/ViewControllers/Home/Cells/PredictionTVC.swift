import UIKit
import Charts
import Alamofire

protocol ComponentProductCellDelegate {
    func touchUpInside(index: Int)
}

class PredictionTVC: UITableViewCell {
//    @IBOutlet weak var stockItemView: UIStackView!
    
    @IBOutlet weak var component: UIView!
    @IBOutlet weak var stockItemOpenButton: UIButton!
    @IBOutlet weak var stockCodeLabel: UILabel!
    @IBOutlet weak var stockNameLabel: UILabel!
    @IBOutlet weak var stockPriceLabel: UILabel!
    @IBOutlet weak var compareStockPriceRatioLabel: PaddingLabel!
    @IBOutlet weak var stockEstimateLabel: UILabel!
    @IBOutlet weak var compareStockEstimateRatioLabel: PaddingLabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    @IBOutlet weak var barLabel: PaddingLabel!
    @IBOutlet weak var stockerChartView: StockerChartView!
    
    var index: Int = 0
    var delegate: ComponentProductCellDelegate?
    
    var chartDataEntry : [ChartDataEntry] = [] {
        didSet{
            stockerChartView.setUp(chartDataEntry)
        }
    }
    
    var chartLimitLineValue : Double = 0.0 {
        didSet{
            stockerChartView.setChartLimitLine(chartLimitLineValue)
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //Setting Style
        setContainerStyle()
    }
    
    @IBAction func touchUpInside(_ sender: UIButton) {
//        stackView.addArrangedSubview(self.stockerChartView)
        self.delegate?.touchUpInside(index: self.index)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setContainerStyle(){
        component.layer.cornerRadius = 10
        component.layer.shadowOpacity = 0.05
        component.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        component.layer.shadowRadius = 10
        component.layer.masksToBounds = false
        
        barLabel.layer.cornerRadius = 3
        barLabel.layer.masksToBounds = true

        compareStockPriceRatioLabel.layer.masksToBounds = true
        compareStockPriceRatioLabel.layer.cornerRadius = 5
        compareStockPriceRatioLabel.backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
        compareStockPriceRatioLabel.clipsToBounds = true
        
        compareStockEstimateRatioLabel.layer.masksToBounds = true
        compareStockEstimateRatioLabel.layer.cornerRadius = 5
        compareStockEstimateRatioLabel.backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
        compareStockEstimateRatioLabel.clipsToBounds = true
        
        stockerChartView.layer.masksToBounds = true
        stockerChartView.layer.cornerRadius = 5
        stockerChartView.layer.borderWidth = 2
        stockerChartView.layer.borderColor = #colorLiteral(red: 0.001231680741, green: 0.6993102431, blue: 0.9645704627, alpha: 1)
        stockerChartView.clipsToBounds = true
        
    }
}
