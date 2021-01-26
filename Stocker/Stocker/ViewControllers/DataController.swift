//
//  DataController.swift
//  Stocker
//
//  Created by SungJin Kim on 2021/01/05.
//

import UIKit

class DataController: UIViewController {
    
    @IBOutlet weak var dataTableView: UITableView!
    
    let identifier = ["LogoVC", "HeaderVC", "PastDataVC"]
    
    var pastData: PastStockDataResponse? {
        didSet{
            self.dataTableView.reloadData()
        }
    }
    
    var weekDataList: [PastStockDataItem]=[]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.estimatedRowHeight = 100
        dataTableView.rowHeight = UITableView.automaticDimension
        dataTableView.backgroundColor = UIColor.systemGray6
        DataAPI.shared.getPastData { (result) in
            switch result {
            case .success(let _pastData):
                self.pastData = _pastData
                for weekData in _pastData.weekData {
                    self.weekDataList.append(PastStockDataItem(weekData: weekData, selected: false))
                }
                self.weekDataList[0].selected = !self.weekDataList[0].selected
            case .failure(let error):
                let alert = UIAlertController(
                    title: "에러가 발생 했습니다.",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                self.present(alert, animated: true)
            }
        }
        // Do any additional setup after loading the view.
    }

}

extension DataController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return pastData?.weekData.count ?? 0
        default:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier[indexPath.section], for: indexPath) as! LogoVC
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier[indexPath.section], for: indexPath) as! HeaderVC
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier[indexPath.section], for: indexPath) as! PastDataVC
            
            let labelCollection = [cell.stockCollection1,cell.stockCollection2,cell.stockCollection3,cell.stockCollection4,cell.stockCollection5]
            let paddingCollection = [cell.paddingCollection1,cell.paddingCollection2,cell.paddingCollection3,cell.paddingCollection4,cell.paddingCollection5]
            
            let rowData = weekDataList[indexPath.row].weekData
            cell.weekLabel.text = nowWeekIndex(weekIndex: rowData.weekIndex)
            
            var totalRevenue:Double = 1
            
            for i in 0...4{
                let stockLabels = labelCollection[i]!
                let paddingLabels = paddingCollection[i]!
                let data = rowData.stockList[i]
                
                stockLabels[0].text = data.stockCode
                stockLabels[1].text = data.stockName
                stockLabels[2].text = decimalWon(Int(round(data.stockMaxPrice)))
                stockLabels[3].text = decimalWon(Int(round(data.stockEstimatePrice)))
                
                let maxPercent = calPercent(data.stockMaxPrice, data.stockFirstPrice)
                let estimatePercent = calPercent(data.stockEstimatePrice, data.stockFirstPrice)
                setLabelLayout(percent: maxPercent, paddingLabel: paddingLabels[0])
                setLabelLayout(percent: estimatePercent, paddingLabel: paddingLabels[1])
                totalRevenue *= calTotalRevenue(maxPercent, estimatePercent)
            }
            setTotalRevenueLabel(totalRevenue: totalRevenue, label: cell.totalRevenueLabel)
            cell.index = indexPath.row
            cell.delegate = self
            dropdownEvent(selected: weekDataList[indexPath.row].selected, OutView: cell.OutView, contentStack: cell.contentStack)
            if self.traitCollection.userInterfaceStyle == .dark {
                for view in cell.OutView {
                    view.backgroundColor = UIColor.systemGray6
                }
            } else {
                for view in cell.OutView {
                    view.backgroundColor = UIColor.white
                }
            }

            return cell
        }
    }
}

extension DataController: DropdownCellDelegate {
    func selectedInfoBtn(index: Int) {
        weekDataList[index].selected = !weekDataList[index].selected
        dataTableView.reloadRows(at: [IndexPath.init(row: index, section: 2)], with: .fade)
    }
}

func setTotalRevenueLabel(totalRevenue:Double, label:PaddingLabel) {
    
    label.layer.masksToBounds = true
    label.layer.cornerRadius = 5
    label.clipsToBounds = true
    if totalRevenue >= 1 {
        label.backgroundColor = #colorLiteral(red: 0.9684663415, green: 0.3563124835, blue: 0.5123978257, alpha: 1)
        label.text = "+\(round((totalRevenue - 1) * 1000)/10)%"
    } else {
        label.backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
        label.text = "\(round((totalRevenue - 1) * 1000)/10)%"
    }
}

func calTotalRevenue(_ maxPercent:Double, _ estimatePercent:Double) -> Double {
    return min(1+maxPercent/100, 1+estimatePercent/100)
}

func nowWeekIndex(weekIndex:String)->String{
    var year = ""
    var month = ""
    var week = ""
    
    for (index, value) in weekIndex.enumerated(){
        let str = String(value)
        if index <= 3 {
            year += str
        } else if index <= 5 {
            if str == "0" {
                if index == 5 {
                    month += str
                }
            } else {
                month += str
            }
        } else if index == 6 {
            week += str
        }
    }
    return "\(year)년도 \(month)월 \(week)주차"
}

func decimalWon(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: value))! + " 원"
        return result
}

func calPercent(_ val1: Double, _ val2: Double) -> Double {
    return round((val1 - val2) / val2 * 10000) / 100
}

func setLabelLayout(percent: Double, paddingLabel:PaddingLabel){
    paddingLabel.layer.masksToBounds = true
    paddingLabel.layer.cornerRadius = 5
    paddingLabel.clipsToBounds = true
    if percent >= 0 {
        paddingLabel.backgroundColor = #colorLiteral(red: 0.9684663415, green: 0.3563124835, blue: 0.5123978257, alpha: 1)
        paddingLabel.text = "+\(percent)%"
    } else {
        paddingLabel.backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
        paddingLabel.text = "\(percent)%"
    }
}

func dropdownEvent(selected:Bool,OutView:[UIView], contentStack:UIStackView){
    if !selected {
        OutView.forEach { subview in
            subview.removeFromSuperview()
        }
    } else {
        OutView.forEach { subview in
            contentStack.addArrangedSubview(subview)
        }
    }
}
