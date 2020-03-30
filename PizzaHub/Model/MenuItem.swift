//
//  MenuItem.swift
//  PizzaHub
//
//  Created by Charles Hefele on 2/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import FirebaseFirestore

class MenuItem: FirebaseCodable {
    var id: String
    @Published var name: String
    @Published var price: String
    
    var data: [String: Any] {
        return [
            "name": name,
            "price": price,
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
            let price = data["price"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.price = price
    }
}
