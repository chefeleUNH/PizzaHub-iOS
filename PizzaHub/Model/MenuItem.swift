//
//  MenuItem.swift
//  PizzaHub
//
//  Created by Charles Hefele on 2/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import UIKit

class MenuItem {
    var name: String
    var price: Double
    
    init?(name: String, price: Double) {
        if name.isEmpty || price < 0 {
            return nil
        }
        self.name = name
        self.price = price
    }
}
