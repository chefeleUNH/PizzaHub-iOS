//
//  Pizzeria.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/3/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import FirebaseFirestore

class Pizzeria: FirebaseCodable, Equatable {
    static func == (lhs: Pizzeria, rhs: Pizzeria) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String
    @Published var name: String
    @Published var city: String
    @Published var state: String
    @Published var photo: String
    @Published var logo: String
    
    var data: [String: Any] {
        return [
            "name": name,
            "city": city,
            "state": state,
            "photo": photo,
            "logo": logo
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
            let city = data["city"] as? String,
            let state = data["state"] as? String,
            let photo = data["photo"] as? String,
            let logo = data["logo"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.city = city
        self.state = state
        self.photo = photo
        self.logo = logo
    }
    
    #if DEBUG
    static let example = Pizzeria(id: "1", data: ["name": "Vittoria's",
                                                  "city": "Westerly",
                                                  "state": "RI",
                                                  "photo": "2",
                                                  "logo": "logo/vittorias.png"])!
    #endif
}
