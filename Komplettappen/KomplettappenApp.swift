//
//  KomplettappenApp.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-26.
//

import SwiftUI
import Firebase

@main
struct KomplettappenApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            TodoListView()
        }
    }
}
