//
//  Pizzeria.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/3/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import FirebaseFirestore

struct Pizzeria {
    var id: String
    var name: String
    var city: String
    var state: String
    
    var dictionary: [String: Any] {
      return [
        "name": name,
        "city": city,
        "state": state
      ]
    }
}

extension Pizzeria: FirebaseCodable {
    
    init?(id: String, dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let city = dictionary["city"] as? String,
            let state = dictionary["state"] as? String
        else {
            return nil
        }
        
        self.init(id: id,
                  name: name,
                  city: city,
                  state: state)
    }
}
