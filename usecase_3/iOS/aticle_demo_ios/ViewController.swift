//
//  ViewController.swift
//  aticle_demo_ios
//
//  Created by NazarKo on 5/29/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set Delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
           
        // Register cells
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        let index = indexPath.item % 3;
        if(index == 0 ){
            let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = Double.pi * 2
            rotation.duration = 5.0
            rotation.isCumulative = true
            rotation.repeatCount = Float.greatestFiniteMagnitude
            cell.setImage(index: indexPath.item,animation: rotation,size: CGSize(
            width: self.view.frame.size.width/10,
            height: self.view.frame.size.width/10))
        }
        if(index == 1 ){
            let scale: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
            scale.toValue = 1.0
            scale.fromValue = 0.0
            scale.duration = 5.0
            scale.repeatCount = Float.greatestFiniteMagnitude
            cell.setImage(index: indexPath.item,animation: scale,size: CGSize(
            width: self.view.frame.size.width/10,
            height: self.view.frame.size.width/10))
        }
        if(index == 2 ){
            let fade: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
            fade.toValue = 1.0
            fade.fromValue = 0.0
            fade.duration = 5.0
            fade.repeatCount = Float.greatestFiniteMagnitude
            cell.setImage(index: indexPath.item,animation: fade,size: CGSize(
            width: self.view.frame.size.width/10,
            height: self.view.frame.size.width/10))
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 0.0
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: self.view.frame.size.width/10,
            height: self.view.frame.size.width/10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 0.0
     }
    
}




