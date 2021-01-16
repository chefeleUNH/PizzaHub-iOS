//
//  AppTabView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        TabView {
            PizzeriaListView()
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
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle").font(.title)
                    Text("Profile")
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
