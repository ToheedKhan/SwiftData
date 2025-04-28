//
//  Item.swift
//  Grocery List
//
//  Created by Toheed Khan on 28/04/25.
//

import Foundation
import SwiftData

/*
 @Model macro tells swift data that we want to be able to load and
 save any grocery list objects using a database.
 Also, this model will convert our item class into a stored model managed by Swift data.
 */
@Model
class Item {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
