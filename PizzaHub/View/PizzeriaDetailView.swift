//
//  PizzeriaDetailView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/14/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI

struct PizzeriaDetailView: View {
    let pizzeria: Pizzeria
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(pizzeria.name)
                .font(.largeTitle)
            HStack {
                Text(pizzeria.city)
                Text(pizzeria.state)
                Spacer()
            }
        }.padding()
    }
}

struct PizzeriaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzeriaDetailView(pizzeria:
            Pizzeria(id: "1234",
                     name: "Vittoria's",
                     city: "Westerly",
                     state: "RI"))
    }
}
