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
        let smallPepperoniItem = MenuItem(id: "1", data: ["name": "Small Pepperoni", "price": "12.50"])
        XCTAssertNotNil(smallPepperoniItem)
        
        let largeSupremeItem = MenuItem(id: "1", data: ["name": "Large Supreme", "price": "27.00"])
        XCTAssertNotNil(largeSupremeItem)
    }
    
    func testMenuItemInitFails() {
        let missingNameItem = MenuItem(id: "1", data: ["price": "12.50"])
        XCTAssertNil(missingNameItem)
        
        let missingPriceItem = MenuItem(id: "1", data: ["name": "Small Pepperoni"])
        XCTAssertNil(missingPriceItem)
    }
    
    func testShoppingCartAddItem() {
        let smallPepperoniItem = MenuItem(id: "1", data: ["name": "Small Pepperoni", "price": "12.50"])
        let largeSupremeItem = MenuItem(id: "1", data: ["name": "Large Supreme", "price": "27.00"])
        let cart = ShoppingCart()
        XCTAssertEqual(0, cart.items.count)
        cart.addItem(item: smallPepperoniItem!)
        XCTAssertEqual(1, cart.items.count)
        cart.addItem(item: largeSupremeItem!)
        XCTAssertEqual(2, cart.items.count)
    }
    
    func testShoppingCartReturnTotal() {
        let smallPepperoniItem = MenuItem(id: "1", data: ["name": "Small Pepperoni", "price": "12.50"])
        let largeSupremeItem = MenuItem(id: "1", data: ["name": "Large Supreme", "price": "27.00"])
        let cart = ShoppingCart()
        cart.addItem(item: smallPepperoniItem!)
        cart.addItem(item: largeSupremeItem!)
        XCTAssertEqual(39.50, cart.returnTotal())
    }

}
