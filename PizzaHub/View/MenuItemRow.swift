//
//  MenuItemRow.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/7/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct MenuItemRow: View {
    @ObservedObject var menuItem: MenuItem
    @State var quantity = 0
    
    var body: some View {
        HStack {
            Text(menuItem.name)
            Text(menuItem.price)
            Spacer()
            Button(action: {
                self.decrementQty()
            }) {
                Text("-")
            }.buttonStyle(BorderlessButtonStyle())
            Text(String(quantity))
            Button(action: {
                self.incrementQty()
            }) {
                Text("+")
            }.buttonStyle(BorderlessButtonStyle())
        }
    }
    
    func decrementQty() {
        if quantity > 0 {
            self.quantity -= 1
        }
    }
    
    func incrementQty() {
        self.quantity += 1
    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(menuItem: MenuItem.example)
    }
}
