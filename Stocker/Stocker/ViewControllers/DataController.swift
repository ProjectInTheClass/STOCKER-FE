//
//  DataController.swift
//  Stocker
//
//  Created by SungJin Kim on 2021/01/05.
//

import UIKit

class DataController: UIViewController {
    
    @IBOutlet weak var dataTableView: UITableView!
    
    let identifier = ["LogoVC", "CumRevenueVC", "PastDataVC"]
    
    var pastData: PastStockDataResponse? {
        didSet{
            self.dataTableView.reloadData()
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.estimatedRowHeight = 200
        dataTableView.rowHeight = UITableView.automaticDimension
        
        DataAPI.shared.getPastData { (result) in
            switch result {
            case .success(let _pastData):
                self.pastData = _pastData
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
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier[indexPath.section], for: indexPath) as! CumRevenueVC
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier[indexPath.section], for: indexPath) as! PastDataVC
            return cell
        }
    }
}
