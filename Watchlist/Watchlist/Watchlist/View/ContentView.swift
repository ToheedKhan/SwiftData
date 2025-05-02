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
            if !movies.isEmpty {
                Section(header: VStack {
                    Text("Watchlist")
                      .font(.largeTitle.weight(.black))
                      .foregroundStyle(.blue.gradient)
                      .padding()
                    
                    HStack {
                      Label("Title", systemImage: "movieclapper")
                      Spacer()
                      Label("Genre", systemImage: "tag")
                    }
                  }) {
                    ForEach(movies) { movie in
                        HStack  {
                            Text(movie.title)
                            
                            Spacer()
                            
                            Text(movie.genre.name)
                        } //: LIST ROW
                        //Delete Action
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(movie)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            } //: LOOP
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
        // MARK: - SHEET
        .sheet(isPresented: $isSheetPresented) {
          NewMovieFormView()
        }
    }
}

#Preview("Sample Data") {
  ContentView()
    .modelContainer(Movie.preview)
}

#Preview("Empty List") {
    ContentView().modelContainer(for: Movie.self, inMemory: true)
}
