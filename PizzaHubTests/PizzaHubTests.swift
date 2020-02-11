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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: MenuItem Class Tests

    func testMenuItemInitializationSucceeds() {
        // Cheap item
        let smallPepperoniItem = MenuItem.init(name: "Small Pepperoni", price: 12.50)
        XCTAssertNotNil(smallPepperoniItem)
        
        // Expensive item
        let largeSupremeItem = MenuItem.init(name: "Large Supreme", price: 27.00)
        XCTAssertNotNil(largeSupremeItem)
    }
    
    func testMenuItemInitializationFails() {
        // Item with no description
        let noDescriptionItem = MenuItem.init(name: "", price: 10.00)
        XCTAssertNil(noDescriptionItem)
        
        // Item with negative price item
        let negativePriceItem = MenuItem.init(name: "Large Supreme", price: -5.00)
        XCTAssertNil(negativePriceItem)
    }
    
    // MARK: ShoppingCart Class Tests
    
    func testShoppingCartAddItem() {
        let smallPepperoniItem = MenuItem.init(name: "Small Pepperoni", price: 12.50)
        let largeSupremeItem = MenuItem.init(name: "Large Supreme", price: 27.00)
        let cart = ShoppingCart.init()
        XCTAssertEqual(0, cart.items.count)
        cart.addItem(item: smallPepperoniItem!)
        XCTAssertEqual(1, cart.items.count)
        cart.addItem(item: largeSupremeItem!)
        XCTAssertEqual(2, cart.items.count)
    }
    
    func testShoppingCartReturnTotal() {
        let smallPepperoniItem = MenuItem.init(name: "Small Pepperoni", price: 12.50)
        let largeSupremeItem = MenuItem.init(name: "Large Supreme", price: 27.00)
        let cart = ShoppingCart.init()
        cart.addItem(item: smallPepperoniItem!)
        cart.addItem(item: largeSupremeItem!)
        XCTAssertEqual(39.50, cart.returnTotal())
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
