//
//  NewMovieFromView.swift
//  Watchlist
//
//  Created by Toheed Khan on 02/05/25.
//

import SwiftUI
import SwiftData

struct NewMovieFromView: View {
    // MARK: - PROPERTIES
    
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .kids
    
    
    var body: some View {
        Form {
            List {
                // MARK: - HEADER
                Text("What to Watch")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                
                // MARK: - TITLE
                TextField("Movie Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle.weight(.light))
                
                // MARK: - GENRE
                Picker("Genre", selection: $selectedGenre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }
                
                // MARK: - SAVE BUTTON
                Button {
                    
                } label: {
                    Text("Save")
                        .font(.title2.weight(.medium))
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)
                
                // MARK: - CANCEL BUTTON
                Button {
                    
                } label: {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                }
                
            } //: LIST
            
        } //: FORM
    }
}

#Preview {
    NewMovieFromView()
}
