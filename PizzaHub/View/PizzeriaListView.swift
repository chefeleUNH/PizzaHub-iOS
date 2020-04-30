//
//  PizzeriaListView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 2/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let pizzeriasCollectionRef = Firestore.firestore().collection("pizzerias")
let ordersCollectionRef = Firestore.firestore().collection("orders")

struct PizzeriaListView: View {
    @ObservedObject private var pizzerias = FirebaseCollection<Pizzeria>(collectionRef: pizzeriasCollectionRef)
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AddPizzeriaView()) {
                    Text("Add Pizzeria")
                }
                List {
                    ForEach(pizzerias.items) { pizzeria in
                        NavigationLink(destination: PizzeriaDetailView(pizzeria: pizzeria)) {
                            PizzeriaRow(pizzeria: pizzeria)
                        }
                    }.onDelete(perform: deletePizzeria)
                }
            }
            .navigationBarTitle("Pizzerias")
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func deletePizzeria(at offsets: IndexSet) {
        let index = offsets.first!
        print("Deleting pizzeria: \(pizzerias.items[index])")
        let id = pizzerias.items[index].id
        pizzeriasCollectionRef.document(id).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}

struct PizzeriaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaListView()
    }
}
