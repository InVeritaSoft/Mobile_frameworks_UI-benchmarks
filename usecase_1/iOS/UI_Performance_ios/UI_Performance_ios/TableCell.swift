//
//  TableCell.swift
//  UI_Performance_ios
//
//  Created by NazarKo on 4/3/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import Foundation
import UIKit
import Nuke

class TableCell: UITableViewCell {
    
    static let cache = NSCache<NSString, UIImage>()

    @IBOutlet private var indexLabel: UILabel!
    @IBOutlet private var rotareImageView: UIImageView!
    @IBOutlet private  var staticImageView: UIImageView!

    
    override func prepareForReuse() {
        super.prepareForReuse()
        indexLabel.text = nil
        rotareImageView.image = nil
        staticImageView.image = nil
    }

    // MARK: Cell Configuration

    func configurateTheCell(_ item: Item) {
        indexLabel.text = "\(item.index)"
        downloadImage(item: item)
        contentView.backgroundColor = item.color
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = Double.pi * 2
        rotation.duration = 5.0 
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        rotareImageView.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func downloadImage(item: Item){
        let cacheID = "\(item.index % 20)"  as NSString
        print(TableCell.cache)
        if let cachedData = TableCell.cache.object(forKey: cacheID) {
            rotareImageView.image = cachedData
            staticImageView.image = cachedData
        }else{
            let image = UIImage(named: "\(item.index % 20)");
            TableCell.cache.setObject(image!, forKey: cacheID)
            rotareImageView.image = image
            staticImageView.image = image
        }
    }
}
