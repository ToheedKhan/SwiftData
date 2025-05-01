//
//  EditPetView.swift
//  Paws
//
//  Created by Toheed Khan on 30/04/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditPetView: View {
    
    @Bindable var pet: Pet
    
    /*
     storage for a Photos Picker item to save the user's selection, and an image
     property to store the loaded asset.
     */
    @State private var photosPickerItem: PhotosPickerItem?
    
    var body: some View {
        Form {
            //CONTROL + 6
            // MARK: - IMAGE
            if let imageData = pet.photo {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                        .padding(.top)
                }
            } else {
                CustomContentUnavailableView(
                    icon: "pawprint.circle",
                    title: "No Photo",
                    description: "Add a photo of your favorite pet to make it easier to find them."
                )
                .padding(.top)
            }
            // MARK: - PHOTO PICKER
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                Label("Select a Photo", systemImage: "photo.badge.plus")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - TEXT FIELD
            TextField("Name", text: $pet.name)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle.weight(.light))
                .padding(.vertical)
            
            // MARK: - BUTTON
            Button {
                
            } label: {
                Text("Save")
                    .font(.title.weight(.light))
                    .padding(8)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .listRowSeparator(.hidden)
            .padding(.bottom)
        } //: FORM
        .listStyle(.plain)
        .navigationTitle("Edit \(pet.name)")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: photosPickerItem) {
            Task {
                pet.photo = try? await photosPickerItem?.loadTransferable(type: Data.self)
            }
        }
    }
}

#Preview {
    NavigationStack {
              do {
                let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
                let container = try ModelContainer(for: Pet.self, configurations: configuration)
                let sampleData = Pet(name: "Daisy")
                
                  return EditPetView(pet:sampleData)
                  .modelContainer(container)
              } catch {
                fatalError("Could not load preview data. \(error.localizedDescription)")
              }
    } //: NAVSTACK
    
}
