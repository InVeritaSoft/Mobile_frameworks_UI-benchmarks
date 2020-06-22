//
//  CustomCell.swift
//  com.inveritasoft
//
//  Created by NazarKo on 4/1/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import Foundation
import UIKit

class CustomCell:UITableViewCell{
    
    var indexStr:String?;
    var color:UIColor?;
    
    lazy var content: UIView = {
        let width: CGFloat = contentView.frame.width
        let height: CGFloat = 100
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        let centeredView = UIView(frame: frame)
        centeredView.backgroundColor = UIColor.random()
        return centeredView;
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.textColor = .red
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //addSubview(descriptionLabel)
        addSubview(contentView)
    
//        let width: CGFloat = contentView.frame.width
//        let height: CGFloat = 100
//        let frame = CGRect(x: 0, y: 0, width: width, height: height)
//        let centeredView = UIView(frame: frame)
//
//        self.addSubview(centeredView)
//        centeredView.backgroundColor = UIColor.green
//         centeredView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//         centeredView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//         centeredView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//         centeredView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
