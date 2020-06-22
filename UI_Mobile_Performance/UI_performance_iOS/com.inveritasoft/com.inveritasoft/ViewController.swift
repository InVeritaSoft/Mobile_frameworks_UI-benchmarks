//
//  ViewController.swift
//  com.inveritasoft
//
//  Created by NazarKo on 4/1/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1001;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! UITableViewCell
//        // note that indexPath.section is used rather than indexPath.row
//        cell.textLabel?.text = "gg";
//        // add border and color
//        cell.backgroundColor = .random()
//        cell.layer.borderColor = UIColor.black.cgColor
//        cell.clipsToBounds = true
//        return cell;
//
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell;
        return cell;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        self.tableView.rowHeight = 100.0
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40.0;
//    }


}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

