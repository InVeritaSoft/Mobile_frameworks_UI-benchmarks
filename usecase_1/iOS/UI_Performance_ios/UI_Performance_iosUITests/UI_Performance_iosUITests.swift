//
//  UI_Performance_iosUITests.swift
//  UI_Performance_iosUITests
//
//  Created by NazarKo on 4/3/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import XCTest

class UI_Performance_iosUITests: XCTestCase {

    override func setUp() {
           continueAfterFailure = false
       }

       override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }

       func testScrool() {
           let app = XCUIApplication()
           app.launch()
           forward(app: app)
           //for _ in 0...1 {
               //revert(app: app)
           //}
       }
       
       func customSwipe(refElement:XCUIElement,startdelxy:CGVector,enddeltaxy: CGVector){
             let swipeStartPoint = refElement.coordinate(withNormalizedOffset: startdelxy)
             let swipeEndPoint = refElement.coordinate(withNormalizedOffset: enddeltaxy)
             swipeStartPoint.press(forDuration: 0.01, thenDragTo: swipeEndPoint)

       }

       
       func forward(app: XCUIApplication){
           //let table = app.otherElements["long_list"].firstMatch;
           while(true){
               customSwipe(
                   refElement: app,
                   startdelxy: CGVector.init(dx: 0.0, dy: 0.8),
                   enddeltaxy: CGVector.init(dx: 0.0, dy: 0.2)
               );
           }
           //let table = app.otherElements["long_list"];
           //let lastCell = table.textViews["item_1000"];//table.cells.element(boundBy:table.cells.count-1)
           //app.scrollToElement(element: lastCell,direction: XCUIElement.Direction.Up)
       }
       
   //    func revert(app: XCUIApplication){
   //        let table = app.tables.element(boundBy: 0)
   //        let firstCell = table.cells.element(boundBy: 0)
   //        table.scrollToElement(element: firstCell,direction: XCUIElement.Direction.Down)
   //    }
   //


//       func testLaunchPerformance() {
//           if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//               measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                   XCUIApplication().launch()
//               }
//           }
//       }
   }

   extension XCUIElement
   {
       
       func scrollToElement(element: XCUIElement,direction: Direction) {
           if (direction == .Up){
               while true {
                   swipeUp()
               }
           }else{
               while !element.visible() {
                  swipeDown()
               }
           }
           
       }

       func visible() -> Bool {
           guard self.exists && !self.frame.isEmpty else { return false }
           return XCUIApplication().windows.element(boundBy: 0).frame.contains(self.frame)
       }
       
       
       enum Direction : Int {
           case Up, Down, Left, Right
       }
   }



