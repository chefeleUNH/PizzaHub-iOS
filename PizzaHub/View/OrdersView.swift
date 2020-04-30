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
    @ObservedObject private var orders = FirebaseCollection<Order>(collectionRef: ordersCollectionRef)
    
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
