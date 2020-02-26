//
//  ContentView.swift
//  PizzaHub
//
//  Created by Charles Hefele on 2/11/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let db = Firestore.firestore()

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                createPizzerias()
            }) {
                Text("Create Pizzerias")
                    .font(.largeTitle)
            }
            .padding(10.0)
            
            Button(action: {
                getCollection(collection: "pizzerias")
            }) {
                Text("Get All Pizzerias")
                    .font(.largeTitle)
            }
            .padding(10.0)
            
            Button(action: {
                deleteCollection(collection: "pizzerias")
            }) {
                Text("Delete All Pizzerias")
                    .font(.largeTitle)
            }
            .padding(10.0)
        }
    }
}

private func createPizzerias() {
    let pizzeriasRef = db.collection("pizzerias")
    
    pizzeriasRef.document().setData([
        "name": "Vetrano's",
        "city": "Westerly",
        "state": "RI"
    ])
    
    pizzeriasRef.document().setData([
        "name": "Vittoria's",
        "city": "Westerly",
        "state": "RI"
    ])

    pizzeriasRef.document().setData([
           "name": "Pizza Today",
           "city": "Groton",
           "state": "CT"
    ])

    pizzeriasRef.document().setData([
        "name": "Midway Pizza",
        "city": "Groton",
        "state": "CT"
    ])
}

private func getCollection(collection: String) {
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}

private func deleteCollection(collection: String) {
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
            return
        }

        for document in querySnapshot!.documents {
            print("Deleting \(document.documentID) => \(document.data())")
            document.reference.delete()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
