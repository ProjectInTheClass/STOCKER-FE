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
                for weekData in _pastData.weekData {
                    self.weekDataList.append(PastStockDataItem(weekData: weekData, selected: false))
                }
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
            cell.logoImageView.image = UIImage(named: "Logo")
            return cell
        }else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier[indexPath.section], for: indexPath) as! HeaderVC
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier[indexPath.section], for: indexPath) as! PastDataVC
            let collection = [cell.stockCollection1,cell.stockCollection2,cell.stockCollection3,cell.stockCollection4,cell.stockCollection5]
            
            let rowData = weekDataList[indexPath.row].weekData
            cell.weekLabel.text = rowData.weekIndex
            
            for i in 0...4{
                print(indexPath.row)
                let data = rowData.stockList[i]
                collection[i]?[0].text = data.stockCode
                collection[i]?[1].text = data.stockName
                collection[i]?[2].text = "최고가"
                collection[i]?[3].text = "\(data.stockMaxPrice)"
                collection[i]?[4].text = "예측가"
                collection[i]?[5].text = "\(data.stockEstimatePrice)"
                
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
