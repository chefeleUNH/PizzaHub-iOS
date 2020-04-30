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
    private let dateFormatter: DateFormatter
    
    init(order: Order) {
        self.order = order
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage(image: Image("pizzeria\(order.photo)"))
            Divider()
            Text("Ordered from: \(order.pizzeria)")
                .font(.headline)
            Text("Ordered on: \(dateFormatter.string(from: order.timestamp.dateValue()))")
                .font(.headline)
            Text("Order total: $\(order.total)")
                .font(.headline)
            Divider()
            Text("Items Ordered")
                .font(.largeTitle)
            List {
                ForEach(order.items, id: \.self) { item in
                    Text(item)
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Order Details")
        .listStyle(GroupedListStyle())
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order.example)
    }
}
