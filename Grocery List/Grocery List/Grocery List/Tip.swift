//
//  Tip.swift
//  Grocery List
//
//  Created by Toheed Khan on 30/04/25.
//

import Foundation
import TipKit

struct ButtonTip: Tip {
    
//    var test: Text {
//        .init("Tap to add item")
//    }
    var title: Text = Text("Essential Foods")
    var message: Text? = Text("Add some everyday items to the shopping list.")
    var image: Image? = Image(systemName: "info.circle")
    
}
