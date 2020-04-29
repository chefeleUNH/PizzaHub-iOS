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
        // toggle the payment alert
        self.showingPaymentAlert.toggle()
        
        // upload the order to firebase
        guard let pizzeria = self.cart.pizzeria else {  // null check the pizzeria
            return
        }
        let data = ["timestamp": Timestamp(),
                    "pizzeria": pizzeria.name,
                    "items": self.cart.items.map({ $0.name }),
                    "total": String(format: "%.2f", cart.total)]
            as [String : Any]
        ordersCollectionRef.addDocument(data: data) // post to firebase
        
        // show pizza ready notification to the user
        let content = UNMutableNotificationContent()
        content.title = "Pizza order ready!"
        content.subtitle = "Your order from \(pizzeria.name) is ready for pickup."
        content.sound = UNNotificationSound.default
        
        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let cart = ShoppingCart()
    
    static var previews: some View {
        CheckoutView().environmentObject(cart)
    }
}
