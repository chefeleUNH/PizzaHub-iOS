//
//  Pizzeria.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/3/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import FirebaseFirestore

struct Pizzeria: Identifiable {
    
    let docSnapshot: DocumentSnapshot?
    let id: String
    let name: String
    let city: String
    let state: String
    
    init(id: String = "", name: String, city: String, state: String) {
        self.docSnapshot = nil
        self.id = id
        self.name = name
        self.city = city
        self.state = state
    }
    
    init?(docSnapshot: DocumentSnapshot) {
        guard
            let name = docSnapshot.get("name") as? String,
            let city = docSnapshot.get("city") as? String,
            let state = docSnapshot.get("state") as? String
            else {
                return nil
            }
        
        self.docSnapshot = docSnapshot
        self.id = docSnapshot.documentID
        self.name = name
        self.city = city
        self.state = state
    }

}
