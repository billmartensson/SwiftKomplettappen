//
//  TodoListView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI
import Firebase

struct TodoListView: View {
    
    @State var goLogin = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("TODO")
                
                /*
                NavigationLink(
                    destination: LoginView(),
                    isActive: $goLogin,
                    label: {
                        EmptyView()
                    })
                */
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
            }.fullScreenCover(isPresented: $goLogin, content: {
                LoginView()
            })
        }.onAppear() {
            
            if(Auth.auth().currentUser == nil)
            {
                goLogin = true
            } else {
                goLogin = false
            }
            
        }
        
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}

