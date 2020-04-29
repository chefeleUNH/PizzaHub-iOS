//
//  AppTabView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash").font(.title)
                    Text("Pizzerias")
            }
            
            CartView()
                .tabItem {
                    Image(systemName: "cart").font(.title)
                    Text("Cart")
            }
            
            OrdersView()
                .tabItem {
                    Image(systemName: "square.and.pencil").font(.title)
                    Text("Orders")
            }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        AppTabView().environmentObject(cart)
    }
}
