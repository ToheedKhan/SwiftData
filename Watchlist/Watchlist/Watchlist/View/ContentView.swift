//
//  ContentView.swift
//  Watchlist
//
//  Created by Toheed Khan on 01/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    //  MARK: PROPERTIES
    
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    
    // to store the visibility of the necessary sheet view.
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        List {
            
        } //: LIST
        
        .overlay {
            if movies.isEmpty {
                EmptyListView()
            }
        } //: OVERLAY
        
        //  MARK: SAFE AREA
        .safeAreaInset(edge: .bottom, alignment: .center){
            
            //NEW MOVIEW BOTTON
            Button {
              isSheetPresented.toggle()
            } label: {
              ButtonImageView(symbolName: "plus.circle.fill")
            }
            
        } //: SAFE AREA
    }
}

#Preview("Empty List") {
    ContentView().modelContainer(for: Movie.self, inMemory: true)
}
