//
//  TodoListView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("TODO")
                NavigationLink(
                    destination: LoginView(),
                    label: {
                        Text("LOGIN")
                    })
                
                List {
                    Text("Sak 1")
                    Text("Sak 2")
                    Text("Sak 3")
                }
            }
        }
        
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
