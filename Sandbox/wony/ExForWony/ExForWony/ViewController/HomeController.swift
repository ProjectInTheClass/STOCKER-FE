import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension HomeController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return self.tableView.dequeueReusableCell(withIdentifier: "AppLogoTVC") as! AppLogoTVC
        } else if indexPath.row == 1 {
            return self.tableView.dequeueReusableCell(withIdentifier: "YieldTVC") as! YieldTVC
        } else if indexPath.row == 2{
            return self.tableView.dequeueReusableCell(withIdentifier: "Test") as! ChartTitleTableViewCell
        } else if indexPath.row == 3 {
            return self.tableView.dequeueReusableCell(withIdentifier: "ChartCell") as! Test
        } else {
            return self.tableView.dequeueReusableCell(withIdentifier:
            "StarCell") as! StarTableViewCell
        }
    }
}
