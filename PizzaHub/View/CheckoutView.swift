//
//  CheckoutView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 4/14/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct CheckoutView: View {
    @EnvironmentObject var cart: ShoppingCart
    @State private var showingPaymentAlert = false
    
    var body: some View {
        VStack {
            Text("TOTAL: $\(cart.total, specifier: "%.2f")")
                .font(.largeTitle)
            Button("Confirm order") {
                self.confirmOrder()
            }.padding()
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(cart.total, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")) {
                self.cart.reset()
                })
        }
    }
    
    func confirmOrder() {
        self.showingPaymentAlert.toggle()
        guard let pizzeria = self.cart.pizzeria else {  // null check the pizzeria
            return
        }
        let ordersCollectionRef = pizzeriasCollectionRef.document(pizzeria.id).collection("orders")
        let data = ["timestamp": Timestamp(),
                    "items": self.cart.items.map({ $0.id }),
                    "price": String(format: "%.2f", cart.total)]
            as [String : Any]
        ordersCollectionRef.addDocument(data: data)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        CheckoutView().environmentObject(cart)
    }
}
