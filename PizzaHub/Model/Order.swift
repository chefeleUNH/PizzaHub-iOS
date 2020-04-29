//
//  Order.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/23/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Order : FirebaseCodable {
    var id: String
    @Published var items: [String]
    @Published var pizzeria: String
    @Published var total: String
    @Published var timestamp: Timestamp
    @Published var photo: String
    
    var data: [String: Any] {
        return [
            "items": items,
            "pizzeria": pizzeria,
            "total": total,
            "timestamp": timestamp,
            "photo": photo
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let items = data["items"] as? [String],
            let pizzeria = data["pizzeria"] as? String,
            let total = data["total"] as? String,
            let timestamp = data["timestamp"] as? Timestamp,
            let photo = data["photo"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.items = items
        self.pizzeria = pizzeria
        self.total = total
        self.timestamp = timestamp
        self.photo = photo
    }
    
    #if DEBUG
    static let example = Order(id: "1", data: ["items": ["Cheese Pizza", "Wings"],
                                               "pizzeria": "Rocky's Pizza",
                                               "total": "24.99",
                                               "timestamp": Timestamp(),
                                               "photo": "1"])!
    #endif
}
