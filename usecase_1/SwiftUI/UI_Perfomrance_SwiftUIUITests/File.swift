//
//  File.swift
//  UI_Perfomrance_SwiftUIUITests
//
//  Created by NazarKo on 3/28/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

class OnlineShopUITests: CommonTest {
    
    let contentView = ContentViewObject()
    let itemDetailView = ItemDetailViewObject()
    let cartView = CartViewObject()

    func testAddPrimeItemToCart() {
        let item = "AirPods"
        let expectedPrice = "300"
        
        contentView
            .isDisplaying()
            .filterPrimeOnly()
            .selectItem(itemName: item)
        
        itemDetailView
            .isDisplaying()
            .checkPrice(price: expectedPrice)
            .checkIsPrime()
            .buy()
        
        cartView
            .isDisplaying()
            .wasItemAdded(item: item)
            .checkTotalPrice(price: expectedPrice)
    }
}
