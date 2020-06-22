//
//  LottieViewController.swift
//  lottie_ios_5
//
//  Created by NazarKo on 4/11/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import UIKit

class LottieViewController: UIViewController {

    let data = [
            "A",
            "B",
            "C",
            "D",
            "E",
            "F",
            "G",
            "H",
            "I",
            "J",
            "K",
            "L",
            "M",
            "N",
            "O",
            "P",
            "Q",
            "R",
            "S",
            "T",
            "U",
            "V",
            "W",
            "X",
            "Y",
            "Z",
            "Apostrophe",
            "Colon",
            "Comma",
            "BlinkingCursor",
            "yoga_carpet",
            "books",
            "bitcoin_to_the_moon",
            "powerupp_app_onboard",
            "loading_copy",
   ]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self;
        collectionView.delegate = self;

        collectionView.register(UINib(nibName: "LottieCell", bundle: nil), forCellWithReuseIdentifier: "LottieCell")
        
      

    }
    
//    override func viewDidLayoutSubviews() {
//           super.viewDidLayoutSubviews()
//           
//           self.setupGridView()
//           DispatchQueue.main.async {
//               self.collectionView.reloadData()
//           }
//       }
    

}
extension LottieViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LottieCell", for: indexPath) as! LottieCell
        cell.setAnimation(name: data[indexPath.row])
        return cell;
        
    }
    
    
}

extension LottieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0.0
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: self.view.frame.size.width/5,
            height: self.view.frame.size.width/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0.0
     }
    
}

