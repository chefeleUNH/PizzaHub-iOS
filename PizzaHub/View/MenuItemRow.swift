//
//  MenuItemRow.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/7/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct MenuItemRow: View {
    @EnvironmentObject var cart: ShoppingCart
    @ObservedObject var menuItem: MenuItem
    
    var body: some View {
        HStack {
            Image(menuItem.photo)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            Text(menuItem.name)
            Spacer()
            Text("$\(menuItem.price)")
        }
    }
}

struct MenuItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemRow(menuItem: MenuItem.example)
    }
}
