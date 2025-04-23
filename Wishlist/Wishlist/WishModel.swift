//
//  WishModel.swift
//  Wishlist
//
//  Created by Toheed Khan on 23/04/25.
//

/*
 SwiftData was introduced by Apple at WWDC 2023, held in June 2023, as part of iOS 17, macOS Sonoma, and Xcode 15.
 */
import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
