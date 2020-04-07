//
//  Pizzeria.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/3/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import FirebaseFirestore

class Pizzeria : FirebaseCodable {
    var id: String
    @Published var name: String
    @Published var city: String
    @Published var state: String
    @Published var photo: String
    
    var data: [String: Any] {
        return [
            "name": name,
            "city": city,
            "state": state,
            "photo": photo
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
            let city = data["city"] as? String,
            let state = data["state"] as? String,
            let photo = data["photo"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.city = city
        self.state = state
        self.photo = photo
    }
}
