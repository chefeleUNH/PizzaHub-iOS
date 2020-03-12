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
    @ObservedObject private var fbSession = firebaseSession

    var body: some View {
        List {
            ForEach(fbSession.pizzerias) { pizzeria in
                Text(pizzeria.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
