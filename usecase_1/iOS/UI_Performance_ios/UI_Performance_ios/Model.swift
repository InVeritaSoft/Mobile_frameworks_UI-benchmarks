//
//  Model.swift
//  UI_Performance_ios
//
//  Created by NazarKo on 4/3/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    let index: Int
    let color: UIColor
}

extension Item {
    static func createItems() -> [Item] {
        var list:[Item] = [Item]()
        for i in 0...1000 {
            list.append(Item(index: i,color: UIColor.random()))
        }
        return  list;
    }
}
