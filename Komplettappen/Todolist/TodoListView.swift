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
    @State var goSelectList = false
    
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
            .fullScreenCover(isPresented: $goSelectList, content: {
                SelectListView()
            })
        }.onAppear() {
            
            if(Auth.auth().currentUser == nil)
            {
                goLogin = true
            } else {
                goLogin = false
                
                var currentListId = UserDefaults.standard.string(forKey: "currentListId")
                
                if(currentListId == nil)
                {
                    goSelectList = true
                } else {
                    goSelectList = false
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

