//
//  ItemCell.swift
//  aticle_demo_ios
//
//  Created by NazarKo on 5/29/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import UIKit
import SDWebImage

class ItemCell: UICollectionViewCell {
    
    static let cache = NSCache<NSString, UIImage>()


    @IBOutlet weak var image: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func setImage(index:Int,animation:CABasicAnimation,size:CGSize){
        
        let cacheID = "\(index % 20)"
        
        SDImageCache.shared.queryCacheOperation(forKey: cacheID, done: { (image, data, type) in
            if let image = image {
                self.image.image = image
                self.layer.add(animation, forKey: cacheID)
            } else {
                let image = UIImage(named: cacheID)
                let resizeImage = self.resizeImage(image: image!, targetSize: size);
                self.image.image = resizeImage
                self.layer.add(animation, forKey: cacheID)
                SDImageCache.shared.store(resizeImage, forKey: cacheID, completion: nil)
            }
        })
    }
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width:size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height:  size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x:0, y:0, width : newSize.width, height : newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

}
