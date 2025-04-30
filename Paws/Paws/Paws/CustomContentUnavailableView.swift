//
//  CustomContentUnavailableView.swift
//  Paws
//
//  Created by Toheed Khan on 30/04/25.
//

import SwiftUI

struct CustomContentUnavailableView: View {
    var icon: String
    var title: String
    var description: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomContentUnavailableView(icon: "cat.circle", title: "No Photos", description: "Add a photo to get started.")
}
