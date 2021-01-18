import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    let identifiers : [String] = ["AppLogoTVC", "YieldTVC","PredictionTitleTVC", "PredictionTVC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
    }
}

extension HomeController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return identifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! AppLogoTVC
        }
        else if indexPath.row == 1 {
            return self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row], for: indexPath) as! YieldTVC
        }
        else if indexPath.row == 2 {
            return  self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! PredictionTitleTVC
        } else {
            return  self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! PredictionTVC
        }
    }
}
