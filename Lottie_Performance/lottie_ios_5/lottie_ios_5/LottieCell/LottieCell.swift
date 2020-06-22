//
//  LottieCell.swift
//  lottie_ios_5
//
//  Created by NazarKo on 4/11/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import UIKit
import Lottie

class LottieCell: UICollectionViewCell {

    @IBOutlet weak var animationView: AnimationView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setAnimation(name:String){
        let animation = Animation.named(name, subdirectory: "Mobilo")
        animationView.animation = animation
        animationView.play(fromProgress: 0,
                        toProgress: 1,
                        loopMode: LottieLoopMode.loop,
                        completion: { (finished) in
                         if finished {
                           print("Animation Complete")
                         } else {
                           print("Animation cancelled")
                         }
        })
    }

}
