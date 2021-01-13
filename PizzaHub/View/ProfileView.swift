//
//  ProfileView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 1/12/21.
//  Copyright © 2021 Charles Hefele. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var session: FirebaseSession
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        VStack {
            if (session.user != nil) {
                Text("Email: \(session.user?.email ?? "undefined")")
                Button(action: session.signOut) {
                    Text("Sign Out")
                }
            } else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}
