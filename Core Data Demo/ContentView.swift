//
//  ContentView.swift
//  Core Data Demo
//
//  Created by Philippe Reichen on 12/8/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    // Sort results
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "age", ascending: true)],
//                  predicate: NSPredicate(format: "name contains[c] 'joe'") ) var people: FetchedResults<Person>
    
//    @State var people = [Person]()
//    @State var filterByText = ""
    
    @FetchRequest(sortDescriptors: []) var families: FetchedResults<Family>
    
    var body: some View {
        
        VStack {
        Button(action: addItem) {
                                Label("Add Item", systemImage: "plus")
                            }
//            TextField("Filter Text", text: $filterByText)
//
//            // Fetch by using enter
////            { _ in
//                // Fetch new data
////                fetchData()
//       //     }
//        .border(Color.black, width:  1)
//                .padding()
//
//
            
            List { ForEach(families) { family in
                
                Text("\(family.name ?? ""), member count: \(family.members?.count ?? 0 )")
//                    .onTapGesture {
//                        // For changing
//                        person.name = "Joe"
//                      try! viewContext.save()
//
//                        // For deleting
//                        viewContext.delete(person)
//                        try! viewContext.save()
                        
                    }
            }
            }
        }
//        .onChange(of: filterByText, perform: { value in
//            fetchData()
//        })
        
        
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
    
//    func sampleCode() {
//
//        let f = Family(context: viewContext)
//
//        f.name = "Collins Family"
//
//        let p = Person(context: viewContext)
//
////        p.family = f
//
//        f.addToMembers(p)
//
//        // Save
//        try! viewContext.save()
//
//    }
    
    
//
//    func fetchData() {
//
//
//         // Create etch request
//        let request = Family.fetchRequest()
//        // Set sort descriptors and predicates
////        request.sortDescriptors = [NSSortDescriptor(key: "age", ascending: true)]
////        request.predicate = NSPredicate(format: "name contains %@", filterByText)
//        // Execute the fetch
//
//        DispatchQueue.main.async {
//            do {
//            let results = try viewContext.fetch(request)
//                // Update the state property
//                self.people  = results
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//
//    }

    private func addItem() {
        
        let family = Family(context:viewContext)
        family.name = String("Family #\(Int.random(in:0...20))")
        
        let numberOfMembers = Int.random(in:0...5)
        
        for _ in 0...numberOfMembers {
            let p = Person(context: viewContext)
            p.age = String(Int.random(in: 0...20))
            p.name = "Tom"
            p.family = family
        }
//        let p = Person(context: viewContext)
//        p.age = String(Int.random(in: 0...20))
//        p.name = "Tom"
//
        do {
        try viewContext.save()
        } catch {
            // Error with saving
            
        }
        //        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
