//
//  ViewController.swift
//  lottie_ios_3
//
//  Created by NazarKo on 4/11/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import UIKit

class LottieCollectionViewController: UICollectionViewController {

   
    
    let data = ["1","2","3","4","5","6","7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView?.register(UINib(nibName:"LottieCell",bundle:nil), forCellWithReuseIdentifier: "LottieCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return self.data.count
       }
       
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LottieCell", for: indexPath) as! LottieCell;
           cell.setData(text:self.data[indexPath.row]);
           return cell;
           
       }
    
    
 
}


