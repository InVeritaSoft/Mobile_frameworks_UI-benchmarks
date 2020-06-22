//
//  ContentView.swift
//  UI_Perfomrance_SwiftUI
//
//  Created by NazarKo on 3/27/20.
//  Copyright © 2020 NazarKo. All rights reserved.
//

import SwiftUI

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}


func startScrool()  {
    
}

struct ContentView: View {
    
    
   let numbers = Array(0...1001);
   var body: some View {
    ZStack(alignment: .leading) {
        Button("Start Scrool", action: startScrool).zIndex(1).position(x:100,y:50)
        List(numbers,id: \.self) { index in
            CellView(index)
            }.accessibility(identifier: "long_list").padding(0.0)
        }

    }
}

struct CellView: View {
    
   @State var angle: Double = 0.0
   @State var isAnimating = false
    
    var index: Int

    init(_ index: Int) {
        self.index = index
    }
   
    var foreverAnimation: Animation {
        Animation.linear(duration: 5.0)
            .repeatForever(autoreverses: false)
    }
    
   let numbers = Array(0...1001);
   var body: some View {
    HStack {
        Image("\(self.index % 20)")
            .resizable()
            .frame(width:100,height: 100)
        Image("\(self.index % 20)")
            .resizable()
            .frame(width:100,height: 100)
            .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
            .animation(self.foreverAnimation)
            .onAppear {self.isAnimating = true}
        Text("\(self.index)").frame(
            maxWidth: .infinity,
            alignment: .topLeading
        ).padding(0.0).accessibility(identifier: "item_\(self.index)")
    }.frame(height: 100).background(Color(UIColor.random())).padding(0.0)
  }
}

struct PeopleList : View {
    @State var angle: Double = 0.0
    @State var isAnimating = false

    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }

    var body: some View {
        Button(action: {}, label: {
            Image(systemName: "2")
                .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                .animation(self.foreverAnimation)
                .onAppear {
                    self.isAnimating = true
            }
        })
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleList().padding(0.0)
    }
}
