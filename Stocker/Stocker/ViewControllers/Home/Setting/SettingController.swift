//
//  SettingController.swift
//  Stocker
//
//  Created by 정원영 on 2021/01/25.
//

import UIKit

class SettingController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    let identifiers : [String] = ["SettingTitleTVC", "CustomInfoTVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

}

extension SettingController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return identifiers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            return settingTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.section]) as! SettingTitleTVC
        } else {
            return settingTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.section]) as! CustomInfoTVC
        }
    }
}
