//
//  AppView.swift
//
//
//  Created by Charles Hefele on 4/11/20.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Pizzerias")
            }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
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
