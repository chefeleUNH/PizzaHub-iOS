//
//  CartView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: ShoppingCart
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(cart.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckoutView()) {
                        Text("Place Order")
                    }
                }.disabled(cart.items.isEmpty)
            }
            .navigationBarTitle("Shopping Cart")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        cart.items.remove(atOffsets: offsets)
    }
}

struct CartView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        CartView().environmentObject(cart)
    }
}
