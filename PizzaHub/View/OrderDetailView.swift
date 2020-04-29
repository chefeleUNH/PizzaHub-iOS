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
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(order.pizzeria)
            Text("$\(order.total)")
            Text(dateFormatter.string(from: order.timestamp.dateValue()))
            Spacer()
            //TODO: add a list of all of the items in the order
        }
        .navigationBarTitle("Order Details")
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order.example)
    }
}
