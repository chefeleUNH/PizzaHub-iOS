//
//  FirebaseSession.swift
//  PizzaHub
//
//  Created by Charles Hefele on 3/3/20.
//  Copyright © 2020 Charles Hefele. All rights reserved.
//

import FirebaseFirestore

let firebaseSession = FirebaseSession() // singleton

class FirebaseSession: ObservableObject {
    @Published var pizzerias = [Pizzeria]()
    private let pizzeriasCollection = Firestore.firestore().collection("pizzerias")
        
    init() {
        listenForChanges()
    }
    
    // Reference link : https://firebase.google.com/docs/firestore/query-data/listen
    func listenForChanges() {
        pizzeriasCollection.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                print("Error fetching snapshots: \(error!)")
                return
            }
            snapshot.documentChanges.forEach { diff in
                if (diff.type == .added) {
                    print("Pizzeria added: \(diff.document.data())")
                    let pizzeria = Pizzeria(id: diff.document.documentID,
                                            name: diff.document.get("name") as! String,
                                            city: diff.document.get("city") as! String,
                                            state: diff.document.get("state") as! String)
                    self.pizzerias.append(pizzeria)
                }
                if (diff.type == .modified) {
                    print("Pizzeria modified: \(diff.document.data())")
                    guard let modifiedIndex = self.pizzerias.firstIndex(where: { $0.id == diff.document.documentID }) else {
                        print("Could not find modified pizzeria in data model")
                        return
                    }
                    self.pizzerias[modifiedIndex].name = diff.document.get("name") as! String
                    self.pizzerias[modifiedIndex].city = diff.document.get("city") as! String
                    self.pizzerias[modifiedIndex].state = diff.document.get("state") as! String
                }
                if (diff.type == .removed) {
                    print("Pizzeria removed: \(diff.document.data())")
                    guard let removedIndex = self.pizzerias.firstIndex(where: { $0.id == diff.document.documentID }) else {
                        print("Could not find removed pizzeria in data model")
                        return
                    }
                    self.pizzerias.remove(at: removedIndex)
                }
            }
        }
    }
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/add-data
    func createPizzeria(name: String, city: String, state: String) {
        pizzeriasCollection.document().setData([
            "name": name,
            "city": city,
            "state": state
        ])
    }
    
    // Reference link: https://firebase.google.com/docs/firestore/manage-data/delete-data
    func deletePizzeria(index: Int) {
        print("Deleting pizzeria: \(pizzerias[index])")
        let id = self.pizzerias[index].id
        pizzeriasCollection.document(id).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}