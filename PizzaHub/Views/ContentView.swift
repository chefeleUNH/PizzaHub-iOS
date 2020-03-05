//
//  ContentView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 2/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @ObservedObject var session = FirebaseSession()

    var body: some View {
        NavigationView {
            Group {
                VStack {
                    NavigationLink(destination: AddPizzeria()) {
                        Text("Add Pizzeria")
                    }
                    List {
                        ForEach(self.session.pizzerias) { pizzeria in
                            Text(pizzeria.name)
                        }
                    }
                }
            }
            .onAppear(perform: initSession)
            .navigationBarTitle(Text("Pizzerias"))
            .padding()
        }
    }
    
    func initSession() {
        session.listen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
