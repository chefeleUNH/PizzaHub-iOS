//
//  OrdersView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/23/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let ordersCollectionRef = Firestore.firestore().collection("orders")

struct OrdersView: View {
    @EnvironmentObject var session: FirebaseSession
    
    var body: some View {
        OrdersInternalView(orders: FirebaseCollection<Order>(query: ordersCollectionRef.whereField("user_id", isEqualTo: session.user?.uid ?? "nil").order(by: "timestamp", descending: true)))
    }
}

struct OrdersInternalView: View {
    @EnvironmentObject var session: FirebaseSession
    @ObservedObject private var orders: FirebaseCollection<Order>
    
    init(orders: FirebaseCollection<Order>) {
        self.orders = orders
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orders.items) { order in
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            OrderRow(order: order)
                        }
                    }
                }
            }
            .navigationBarTitle("Order History")
        }
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
