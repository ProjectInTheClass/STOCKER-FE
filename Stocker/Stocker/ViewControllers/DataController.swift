//
//  DataController.swift
//  Stocker
//
//  Created by SungJin Kim on 2021/01/05.
//

import UIKit

class DataController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var dataTableView: UITableView!
    
    let identifier = ["LogoVC", "CumRevenueVC", "PastDataVC"]
    
    var pastData: pastStockDataResponse? {
        didSet{
            self.dataTableView.reloadData()
        }
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTableView.dataSource = self
        dataTableView.estimatedRowHeight = 200
        dataTableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
