import UIKit

struct temp {
    var selected : Bool
}

class HomeController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    let identifiers : [String] = ["AppLogoTVC", "YieldTVC","PredictionTitleTVC", "PredictionTVC"]
    
    var screenInit : Bool = true
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.dataSource = self
        self.homeTableView.estimatedRowHeight = 200
        self.homeTableView.rowHeight = UITableView.automaticDimension
    }
}

extension HomeController : ComponentProductCellDelegate{
    func touchUpInside(index: Int) {
        homeTableView.reloadRows(at: [IndexPath.init(row: 3, section: 0)], with: .fade)
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
        } else if indexPath.row == 1 {
            return self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row], for: indexPath) as! YieldTVC
        } else if indexPath.row == 2 {
            return  self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! PredictionTitleTVC
        } else if indexPath.row == 3 {
            let cell = self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! PredictionTVC
            
            cell.index = indexPath.row
            cell.delegate = self
                        
            return  cell
        }  else {
            return  self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! PredictionTitleTVC
        }
    }
}
