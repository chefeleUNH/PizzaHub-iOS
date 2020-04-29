//
//  OrderRow.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/23/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct OrderRow: View {
    @ObservedObject var order: Order
    private let dateFormatter: DateFormatter
    
    init(order: Order) {
        self.order = order
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(order.pizzeria).font(.headline)
                Text(dateFormatter.string(from: order.timestamp.dateValue()))
            }
            Spacer()
            Text("$\(order.total)")
        }
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(order: Order.example)
    }
}
