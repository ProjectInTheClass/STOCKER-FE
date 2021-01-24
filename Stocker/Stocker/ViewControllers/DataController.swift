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
        DataAPI.shared.getPastData { (result) in
            switch result {
            case .success(let _pastData):
                self.pastData = _pastData
                for weekData in _pastData.weakData {
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
            return pastData?.weakData.count ?? 0
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
            var year = ""
            var month = ""
            var week = ""
            for (index, value) in rowData.weekIndex.enumerated(){
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
            cell.weekLabel.text = "\(year)년도 \(month)월 \(week)주차"
            
            for i in 0...4{
                let stockLabels = labelCollection[i]!
                let paddingLabels = paddingCollection[i]!
                
                paddingLabels[0].layer.masksToBounds = true
                paddingLabels[0].layer.cornerRadius = 5
                paddingLabels[0].clipsToBounds = true
                
                paddingLabels[1].layer.masksToBounds = true
                paddingLabels[1].layer.cornerRadius = 5
                paddingLabels[1].clipsToBounds = true
                
                print(indexPath.row)
                let data = rowData.stockList[i]
                let maxPercent = (data.stockMaxPrice-data.stockFirstPrice)/data.stockFirstPrice
                let estimatePercent = (data.stockEstimatePrice-data.stockFirstPrice)/data.stockFirstPrice
                
                stockLabels[0].text = data.stockCode
                stockLabels[1].text = data.stockName
                stockLabels[2].text = "\(round(data.stockMaxPrice*100)/100)"
                stockLabels[3].text = "\(round(data.stockEstimatePrice*100)/100)"
                paddingLabels[0].text = "\(round(maxPercent*10000)/100)%"
                paddingLabels[1].text = "\(round(estimatePercent*10000)/100)%"

                
                if maxPercent > 0 {
                    paddingLabels[0].backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
                } else if maxPercent == 0 {
                    paddingLabels[0].backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                } else {
                    paddingLabels[0].backgroundColor = #colorLiteral(red: 0.9684663415, green: 0.3563124835, blue: 0.5123978257, alpha: 1)
                }
                
                if estimatePercent > 0 {
                    paddingLabels[1].backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
                } else if estimatePercent == 0 {
                    paddingLabels[1].backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                } else {
                    paddingLabels[1].backgroundColor = #colorLiteral(red: 0.9684663415, green: 0.3563124835, blue: 0.5123978257, alpha: 1)
                }
            }
            
            cell.index = indexPath.row
            cell.delegate = self
            if !weekDataList[indexPath.row].selected {
                cell.OutView.forEach { subview in
                    subview.removeFromSuperview()
        //            contentStack.addArrangedSubview(subview)
                }
            } else {
                cell.OutView.forEach { subview in
    //                subview.removeFromSuperview()
                    cell.contentStack.addArrangedSubview(subview)
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
