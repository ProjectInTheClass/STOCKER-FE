import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        view.addSubview(lineChartView)
//        lineChartView.centerInSuperview()
//        lineChartView.width(to: view)
//        lineChartView.heightToWidth(of: view)
//        setData()
    }
}

extension HomeController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return self.tableView.dequeueReusableCell(withIdentifier: "AppLogoTVC") as! AppLogoTVC
        } else if indexPath.row == 1 {
            return self.tableView.dequeueReusableCell(withIdentifier: "YieldTVC") as! YieldTVC
        } else {
            return self.tableView.dequeueReusableCell(withIdentifier: "Test") as! Test
        }
    }
}
