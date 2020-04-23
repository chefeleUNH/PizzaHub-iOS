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
    
    var body: some View {
        HStack {
            Text(order.pizzeria)
            Spacer()
            Text("$\(order.total)")
//            Spacer()
//            Text(order.timestamp.description)
        }
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(order: Order.example)
    }
}
