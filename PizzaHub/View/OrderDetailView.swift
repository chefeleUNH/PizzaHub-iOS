//
//  OrderDetailView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/23/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct OrderDetailView: View {
    @ObservedObject var order: Order

    var body: some View {
        VStack {
            Text(order.pizzeria)
            Text("$\(order.total)")
//            List {
//                ForEach(order.items) { item in {
//                    Text(item)
//                }
//            }
        }
        .navigationBarTitle("Order Details")
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order.example)
    }
}
