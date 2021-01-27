//
//  GuideAlertViewController.swift
//  Stocker
//
//  Created by 정원영 on 2021/01/27.
//

import UIKit

class GuideAlertViewController: UIViewController {

    @IBOutlet weak var guideContainerView: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    
    @IBOutlet weak var ratio1Label: PaddingLabel!
    @IBOutlet weak var ratio2Label: PaddingLabel!
    
    @IBOutlet weak var component: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guideContainerView.layer.cornerRadius = 10
        guideContainerView.layer.shadowOpacity = 0.05
        guideContainerView.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        guideContainerView.layer.shadowRadius = 10
        guideContainerView.layer.masksToBounds = false
        guideContainerView.layer.zPosition = 5
        
        
        component.layer.cornerRadius = 10
        component.layer.shadowOpacity = 0.05
        component.layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        component.layer.shadowRadius = 10
        component.layer.masksToBounds = false
        component.layer.zPosition = 5
        
        
        
        ratio1Label.backgroundColor = #colorLiteral(red: 0.9684663415, green: 0.3563124835, blue: 0.5123978257, alpha: 1)
        ratio1Label.layer.masksToBounds = true
        ratio1Label.layer.cornerRadius = 5
        ratio1Label.clipsToBounds = true
        
        ratio2Label.backgroundColor = #colorLiteral(red: 0.2899923027, green: 0.9102768898, blue: 0.6825894713, alpha: 1)
        ratio2Label.layer.masksToBounds = true
        ratio2Label.layer.cornerRadius = 5
        ratio2Label.clipsToBounds = true
        
    }
    

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
