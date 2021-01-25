//
//  CustomInfoTVC.swift
//  Stocker
//
//  Created by 정원영 on 2021/01/25.
//

import UIKit

class CustomInfoTVC: UITableViewCell {

    @IBOutlet weak var openUrlButton: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openUrl(_ sender: Any) {
        if let url = URL(string: "https://www.notion.so/43aaf957486f4821b570e7eb671f47a2") {
            UIApplication.shared.open(url)
        }
    }
}
