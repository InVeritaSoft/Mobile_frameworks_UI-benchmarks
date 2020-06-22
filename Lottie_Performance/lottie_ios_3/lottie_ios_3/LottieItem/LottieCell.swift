//
//  LottieCell.swift
//  lottie_ios_3
//
//  Created by NazarKo on 4/11/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import UIKit

class LottieCell: UICollectionViewCell {

    @IBOutlet weak var text: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(text:String){
        self.text.text = text;
    }

}
