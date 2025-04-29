//
//  ContentView.swift
//  Grocery List
//
//  Created by Toheed Khan on 28/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    /*
     this query is really smart.
     It will load all the grocery items immediately when the view appears, and it will also watch the database
     for changes so that whenever any object gets added, deleted or changed, then the items property will
     also be updated.
     */
    @Query private var items: [Item]
    
    @State private var item: String = ""
    
    func addEssentialFoods() {
        modelContext.insert(Item(title: "Bakery & Bread", isCompleted:true))
        modelContext.insert(Item(title: "Apple", isCompleted: false))
        modelContext.insert(Item(title: "Vegetable", isCompleted: true))
        modelContext.insert(Item(title: "Soap", isCompleted: .random()))
        modelContext.insert(Item(title: "Cereals", isCompleted: .random()))
        modelContext.insert(Item(title: "Bakery & Bread", isCompleted:.random()))
    }
    
    var body: some View {
       NavigationStack
        {
            List {
                ForEach(items) {
                    item in
                    Text(item.title)
                        .padding(.vertical, 2)
                        .font(.title.weight(.light))
                        .foregroundStyle(item.isCompleted == false ? Color.primary : Color.accentColor)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: item.isCompleted == false ? "checkmark.circle" : "x.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted == false ? .green : .accentColor)
                        }
                                      
                }
            }
            .navigationTitle("Grocery List")
            .toolbar {
                if items.isEmpty {
                    Button {
                       addEssentialFoods()
                    } label: {
                        Label("Essentials", image: "carrot")
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    TextField("Enter item", text: $item).textFieldStyle(.roundedBorder)
                    Button {
                        let item = Item(title: item, isCompleted: false)
                        modelContext.insert(item)
                        item = ""
                    } label: {
                       Text("Save")
                    }
                    
                }.padding()
            }
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Empty Cart", systemImage: "cart.circle", description: Text("Add some items to the shopping list."))
                }
            }
        }
    }
}

#Preview("Sample Date") {
    let sampleData = [
        Item(title: "Bakery & Bread", isCompleted: true),
        Item(title: "Apple", isCompleted: false),
        Item(title: "Vegetable", isCompleted: .random()),
        Item(title: "Soap", isCompleted: .random()),
        Item(title: "Cereals", isCompleted: .random())
    ]
    //Container to access the database
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    //Insert all asmple data into database
    
    for item in sampleData {
        container.mainContext.insert(item)
    }
    
    return ContentView().modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
