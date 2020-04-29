//
//  PizzeriaDetailView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/14/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct PizzeriaDetailView: View {
    @ObservedObject var pizzeria: Pizzeria
    @ObservedObject var menu: FirebaseCollection<MenuItem>
    private var menuCollectionRef: CollectionReference
    
    init(pizzeria: Pizzeria) {
        self.pizzeria = pizzeria
        self.menuCollectionRef = pizzeriasCollectionRef.document(pizzeria.id).collection("menu")
        self.menu = FirebaseCollection<MenuItem>(collectionRef: menuCollectionRef)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(pizzeria.city)
                Text(pizzeria.state)
                Spacer()
                NavigationLink(destination: EditPizzeriaView(pizzeria: pizzeria)) {
                    Text("Edit")
                }
            }
            CircleImage(image: Image("pizzeria\(pizzeria.photo)"))
            Text("Menu")
                .font(.largeTitle)
            List {
                ForEach(menu.items) { menuItem in
                    NavigationLink(destination: MenuItemDetailView(menuItem: menuItem, pizzeria: self.pizzeria)) {
                        MenuItemRow(menuItem: menuItem)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle(pizzeria.name)
    }
}

struct PizzeriaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaDetailView(pizzeria: Pizzeria.example)
    }
}
