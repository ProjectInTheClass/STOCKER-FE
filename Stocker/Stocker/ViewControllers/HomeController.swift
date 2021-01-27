import UIKit
import Charts

class HomeController: UIViewController, UITableViewDelegate {
        
    @IBOutlet weak var homeTableView: UITableView!
    
    let identifiers : [String] = ["AppLogoTVC", "YieldTVC","PredictionTitleTVC", "PredictionTVC"]
    let sections : [String] = ["Others1","Others2","Others3" ,"Estimate"]
    let estivateSectionRows : [Int] = [0,1,2,3,4]
    var selected : [Bool] = [false,true,true,true,true]
    
    var stockerEstimateList : [StockerEstimate] = [] {
        didSet{
            self.homeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.backgroundColor = UIColor.systemGray6
        self.homeTableView.estimatedRowHeight = 200
        self.homeTableView.rowHeight = UITableView.automaticDimension
        initRefresh()
        //Data Parsing
        getStockListData()
    }
        
    func getStockListData() {
        StockListAPI.shared.getStockListData(completion: { result in
            switch result {
            case .success(let stockList):
                stockList.map{ stockListItem in
                    self.getStockPriceData(stockListItem)
                }
            case .failure(let error):
                print("getStockListData : \(error)")
            }
        })
    }
    
    func getStockPriceData(_ stockListItem : StockList) {
        StockerChartAPI.shared.getStockerChartData(stockCode: stockListItem.stockCode, completion: { result in
            switch result {
            case .success(let data):
                let parsedLastPrice : [ChartDataEntry] =  data.lastPrice.enumerated().map{ (index, price) in
                    ChartDataEntry(x: Double(index), y: price)
                }
                let stockerEstimateItem : StockerEstimate = StockerEstimate(
                    stockCode: stockListItem.stockCode,
                    stockName: stockListItem.stockName,
                    stockPrice: stockListItem.stockPrice,
                    stockEstimatePrice: stockListItem.stockEstimatePrice,
                    lastTime: data.lastTime,
                    lastPrice : data.lastPrice,
                    parsedLastPrice: parsedLastPrice
                )
                self.stockerEstimateList.append(stockerEstimateItem)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func initRefresh(){
        let refresh = UIRefreshControl()
        refresh.tintColor = #colorLiteral(red: 0.001231680741, green: 0.6993102431, blue: 0.9645704627, alpha: 1)
        refresh.addTarget(self, action: #selector(requestData(refresh:)), for: .valueChanged)
        if #available(iOS 10.0, *){
            homeTableView.refreshControl = refresh
        } else {
            homeTableView.addSubview(refresh)
        }
    }
    
    @objc func requestData(refresh: UIRefreshControl){
        stockerEstimateList = []
        self.getStockListData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            refresh.endRefreshing()
        }
    }
    
}

extension HomeController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return estivateSectionRows.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            return self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.section], for: indexPath) as! AppLogoTVC
        } else if indexPath.section == 1 {
            return self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.section], for: indexPath) as! YieldTVC
        } else if indexPath.section == 2 {
            let cell =   self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.section], for: indexPath) as! PredictionTitleTVC
            cell.delegate = self
            return cell
        } else if indexPath.section == 3 {
            let cell = self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.section], for: indexPath) as! PredictionTVC

            cell.index = indexPath.row
            cell.delegate = self
            
            if self.stockerEstimateList.count == 5 {
                let listItem : StockerEstimate = self.stockerEstimateList[indexPath.row]
                var lastTime : String =  String(Int(round(listItem.lastTime)))
                lastTime.insert(":", at: lastTime.index(lastTime.endIndex, offsetBy: -2))
                let maximumLastPrice : Double = listItem.lastPrice.max()!
                                
                let presentPrice = listItem.lastPrice[listItem.lastPrice.endIndex - 1]
                
                let presentPriceRatio = calculateRatio((presentPrice / listItem.stockPrice) - 1)
                let estimatePriceRatio = maximumLastPrice / listItem.stockEstimatePrice
                cell.ratioValues = [presentPriceRatio, estimatePriceRatio]
                
                cell.stockCodeLabel.text = listItem.stockCode
                cell.stockNameLabel.text = listItem.stockName
                
                cell.stockPriceLabel.text = decimalWon(Int(round(presentPrice)))
                cell.stockEstimateLabel.text = decimalWon(Int(round(listItem.stockEstimatePrice)))
                cell.lastTimeLabel.text = lastTime + " 기준"
                cell.chartDataEntry = self.stockerEstimateList[indexPath.row].parsedLastPrice
                cell.chartLimitLineProps = [self.stockerEstimateList[indexPath.row].stockEstimatePrice, maximumLastPrice]
                
                if !self.selected[indexPath.row] {
                    cell.heightConstraint.constant = 300
                } else {
                    cell.heightConstraint.constant = 0
                }
            }
            return cell
        } else {
            return  self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! PredictionTitleTVC
        }
    }
    
    func decimalWon(_ value: Int) -> String {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + " 원"
            return result
    }
    
    func calRevenueRatio(key : String, xValue : Double, yValue : Double) -> Double {
        return 10.0
    }
    
    func calculateRatio(_ val : Double ) -> Double {
        return round(val * 10000) / 100
    }
    
}

extension HomeController : ComponentProductCellDelegate, PredictionTitleTVCDelegate{
    func touchUpInside(index: Int) {
        self.selected[index] = !self.selected[index]
        self.homeTableView.reloadRows(at: [IndexPath.init(row: index, section: 3)], with: .fade)
    }
    
    func openGuideAlert() {
        let alert = self.storyboard?.instantiateViewController(identifier: "GuideAlertViewController") as! GuideAlertViewController
        alert.modalPresentationStyle = .overCurrentContext
        present(alert, animated: true, completion: nil)
    }
}
