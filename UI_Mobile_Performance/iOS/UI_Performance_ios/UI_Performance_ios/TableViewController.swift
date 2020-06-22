//
//  ViewController.swift
//  UI_Performance_ios
//
//  Created by NazarKo on 4/3/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//
import Foundation
import UIKit

class TableViewController: UITableViewController {

    var items = Item.createItems()
    let identifier: String = "tableCell"
    var  tableTimer: Timer = Timer();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
}

extension TableViewController {
    

    func setupUI() {
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        tableView.reloadData()
        tableView.isAccessibilityElement = true
        tableView.accessibilityIdentifier = "long_list"
        let button   = UIButton(
            frame: CGRect(
                origin: CGPoint(
                    x: self.view.frame.width/2 - 50,
                    y: 32
                    
                ),
                size: CGSize(width: 100, height: 48)))
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action:#selector(self.startScrool), for: .touchUpInside)
        navigationController?.view.addSubview(button)
    
    }
    
    @objc func  automaticScroll(){
        if (tableView.contentOffset.y < 1000 * 116){
            tableView.setContentOffset(
                       CGPoint.init(x: tableView.contentOffset.x, y:tableView.contentOffset.y + 70),
                       animated: true)
        }else{
            tableTimer.invalidate();
        }
        
       
    }
    

    
    @objc func  startScrool(){
        //you might want to do this action in ur buttonTargetMethod
        //start timers
        tableTimer = Timer.scheduledTimer(
            timeInterval: 0.3,
            target: self,
            selector: #selector(automaticScroll),
            userInfo: nil,
            repeats:true
        )
    }
        



}

// MARK: - UITableView DataSource

extension TableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell {
            let screenSize = UIScreen.main.bounds
            let separatorHeight = CGFloat(8.0)
            let additionalSeparator1 = UIView.init(frame: CGRect(x: 0, y: 8.0 - separatorHeight, width: screenSize.width, height: separatorHeight))
            additionalSeparator1.backgroundColor = UIColor.white
            
            cell.addSubview(additionalSeparator1)
            
            cell.configurateTheCell(items[indexPath.row])
            let additionalSeparator2 = UIView.init(frame: CGRect(x: 0, y: 116.0 - separatorHeight, width: screenSize.width, height: separatorHeight))
            additionalSeparator2.backgroundColor = UIColor.white
            cell.addSubview(additionalSeparator2)
            return cell
        }
        return UITableViewCell()
    }

}


