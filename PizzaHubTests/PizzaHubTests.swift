//
//  PizzaHubTests.swift
//  PizzaHubTests
//
//  Created by Charles Hefele on 2/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import XCTest
@testable import PizzaHub

class PizzaHubTests: XCTestCase {

    func testMenuItemInitSucceeds() {
        let smallPepperoniItem = MenuItem(id: "1", data: ["name": "Small Pepperoni", "price": "12.50", "photo": "1"])
        XCTAssertNotNil(smallPepperoniItem)
        
        let largeSupremeItem = MenuItem(id: "1", data: ["name": "Large Supreme", "price": "27.00", "photo": "1"])
        XCTAssertNotNil(largeSupremeItem)
    }
    
    func testMenuItemInitFails() {
        let missingNameItem = MenuItem(id: "1", data: ["price": "12.50", "photo": "1"])
        XCTAssertNil(missingNameItem)
        
        let missingPriceItem = MenuItem(id: "1", data: ["name": "Small Pepperoni", "photo": "1"])
        XCTAssertNil(missingPriceItem)
    }
    
    func testShoppingCartAddItem() {
        let smallPepperoniItem = MenuItem(id: "1", data: ["name": "Small Pepperoni", "price": "12.50", "photo": "1"])
        let largeSupremeItem = MenuItem(id: "1", data: ["name": "Large Supreme", "price": "27.00", "photo": "1"])
        let cart = ShoppingCart()
        XCTAssertEqual(0, cart.items.count)
        cart.add(item: smallPepperoniItem!)
        XCTAssertEqual(1, cart.items.count)
        cart.add(item: largeSupremeItem!)
        XCTAssertEqual(2, cart.items.count)
    }
    
    func testShoppingCartTotal() {
        let smallPepperoniItem = MenuItem(id: "1", data: ["name": "Small Pepperoni", "price": "12.50", "photo": "1"])
        let largeSupremeItem = MenuItem(id: "1", data: ["name": "Large Supreme", "price": "27.00", "photo": "1"])
        let cart = ShoppingCart()
        cart.add(item: smallPepperoniItem!)
        cart.add(item: largeSupremeItem!)
        XCTAssertEqual(39.50, cart.total)
    }

}
