import UIKit

struct temp {
    var selected : Bool
}

class HomeController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    let identifiers : [String] = ["AppLogoTVC", "YieldTVC","PredictionTitleTVC", "PredictionTVC"]
    
    var data  : [temp] = [] {
        didSet {
            self.homeTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
        
        self.homeTableView.estimatedRowHeight = 200
        self.homeTableView.rowHeight = UITableView.automaticDimension
    }
}

extension HomeController : ComponentProductCellDelegate{
    func touchUpInside(index: Int) {
        self.data.append(temp(selected: true))
        
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
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                cell.tempView.alpha = cell.tempView.alpha == 0 ? 1 : 0
                cell.tempView.isHidden = !cell.tempView.isHidden
                cell.chartViewHeightConstraint.constant = cell.tempView.isHidden == true ? 0 : 90
            }, completion: nil)
            return  cell
        }  else {
            return  self.homeTableView.dequeueReusableCell(withIdentifier: identifiers[indexPath.row]) as! PredictionTitleTVC
        }
    }
}
