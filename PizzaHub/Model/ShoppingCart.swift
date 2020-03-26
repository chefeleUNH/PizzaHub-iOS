//
//  ShoppingCart.swift
//  PizzaHub
//
//  Created by Charles Hefele on 2/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import UIKit

class ShoppingCart {
    var items = [MenuItem]()
    
    func addItem(item: MenuItem) {
        items.append(item)
    }
    
    func returnTotal() -> Double {
        var total: Double = 0.0
        for item in items {
            total += Double(item.price)!
        }
        return total
    }
    
}
