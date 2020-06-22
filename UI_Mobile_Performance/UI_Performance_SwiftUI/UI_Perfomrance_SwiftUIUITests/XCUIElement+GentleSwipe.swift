//
//  XCUIElement+GentleSwipe.swift
//  UI_Perfomrance_SwiftUIUITests
//
//  Created by NazarKo on 3/28/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

//
//  XCUIElement+GentleSwipe.swift
//
//  Created by Robin Spinks on 11/10/2017.
//
import Foundation
import XCTest

extension XCUIElement
{
    enum direction : Int {
        case Up, Down, Left, Right
    }
    
    func gentleSwipe(_ direction : direction) {
        let half : CGFloat = 0.5
        let adjustment : CGFloat = 0.25
        let pressDuration : TimeInterval = 0.05
        
        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment
        
        let centre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))
        
        switch direction {
        case .Up:
            centre.press(forDuration: pressDuration, thenDragTo: aboveCentre)
            break
        case .Down:
            centre.press(forDuration: pressDuration, thenDragTo: belowCentre)
            break
        case .Left:
            centre.press(forDuration: pressDuration, thenDragTo: leftOfCentre)
            break
        case .Right:
            centre.press(forDuration: pressDuration, thenDragTo: rightOfCentre)
            break
        }
    }
}
