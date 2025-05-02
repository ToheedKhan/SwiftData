//
//  NewMovieFromView.swift
//  Watchlist
//
//  Created by Toheed Khan on 02/05/25.
//

import SwiftUI
/*
import SwiftData
 
 *** NO NEED TO IMPORT ***
 
 Since we are embedding Form view into a sheet, therefore we do not need to import it in this child
 view.
 */

struct NewMovieFromView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.modelContext) var modelContext
    //This property provide us special method "dismiss()"
    @Environment(\.dismiss) var dismiss

    
    @State private var title: String = ""
    @State private var selectedGenre: Genre = .kids
    
    // MARK: - FUNCTIONS
    
    private func addNewMovie() {
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        
        //reset the values of the text field and the picker.
        title = ""
        selectedGenre = .kids
    }
    
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
                    addNewMovie()
                    dismiss()
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
                    dismiss()
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
