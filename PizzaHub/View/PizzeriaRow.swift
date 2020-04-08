//
//  PizzeriaRow.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/7/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct PizzeriaRow: View {
    @ObservedObject var pizzeria: Pizzeria
    
    var body: some View {
        HStack {
            Image("pizzeria\(pizzeria.photo)")
                .resizable()
                .frame(width: 50, height: 50)
            Text(pizzeria.name)
        }
    }
}

struct PizzeriaRow_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaRow(pizzeria:
            Pizzeria(id: "1", data: ["name": "Vittoria's",
                                     "city": "Westerly",
                                     "state": "RI",
                                     "photo": "2"])!)
    }
}
