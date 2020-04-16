//
//  MenuItemDetailView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/14/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct MenuItemDetailView: View {
    @EnvironmentObject var cart: ShoppingCart
    @ObservedObject var menuItem: MenuItem
    
    var body: some View {
        VStack {
            Image(menuItem.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(menuItem.name)
                .font(.largeTitle)
                .padding()
            Button("Add to cart") {
                self.cart.add(item: self.menuItem)
            }.font(.headline)
            Spacer()
        }.navigationBarTitle(Text(menuItem.name), displayMode: .inline)
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        MenuItemDetailView(menuItem: MenuItem.example).environmentObject(cart)
    }
}
