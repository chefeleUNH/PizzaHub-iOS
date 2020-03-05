//
//  AddPizzeria.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/4/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct AddPizzeria: View {
    @State private var name = ""
    @State private var city = ""
    @State private var state = ""
    
    @ObservedObject var session = FirebaseSession()
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Group {
            VStack {
                HStack {
                    Text("Pizzeria Name")
                    TextField("Enter Name", text: $name)
                    .padding()
                }
                HStack {
                    Text("Pizzeria City")
                    TextField("Enter City", text: $city)
                    .padding()
                }
                HStack {
                    Text("Pizzeria State")
                    TextField("Enter State", text: $state)
                    .padding()
                }
                Button(action: {
                    self.addPizzeria()
                }) {
                    Text("Add")
                }
            }
        }
        .padding()
    }
    
    func addPizzeria() {
        if !name.isEmpty && !city.isEmpty && !state.isEmpty {
            let pizzeria = Pizzeria(name: name, city: city, state: state)
            session.addPizzeria(pizzeria: pizzeria)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddPizzeria_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzeria()
    }
}
