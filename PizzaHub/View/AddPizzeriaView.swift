//
//  AddPizzeriaView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/14/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct AddPizzeriaView: View {
    @ObservedObject private var fbSession = firebaseSession
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var city = ""
    @State private var state = ""

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
            fbSession.createPizzeria(name: name, city: city, state: state)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddPizzeriaView_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzeriaView()
    }
}
