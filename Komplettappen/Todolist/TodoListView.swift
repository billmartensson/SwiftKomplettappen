//
//  TodoListView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI
import Firebase

struct TodoListView: View {
    
    @ObservedObject var todolistVM = TodoListViewModel()
    
    @State var goLogin = false
    @State var goSelectList = false
    
    @State var itemName = ""
    
    var body: some View {
        NavigationView {
            
            VStack {
                EmptyView()
                    .fullScreenCover(isPresented: $goSelectList, content: {
                        SelectListView(doneSelectingList: {
                            todolistVM.loadList()
                        })
                    })
                EmptyView()
                    .fullScreenCover(isPresented: $goLogin, content: {
                        LoginView(userLoginOk: {
                            goSelectList = true
                        })
                    })
                
                Text(todolistVM.currentList.listtitle)
                    .navigationBarTitle("Lista")
                    .navigationBarItems(leading: Button("Logout", action: {
                        print("LETS SIGNOUT")
                        do {
                            try Auth.auth().signOut()
                            UserDefaults.standard.removeObject(forKey: "currentListId")
                            goLogin = true
                            print("SIGNOUT OK")
                        } catch {
                            print("SIGNOUT FAIL")
                        }
                        print("SIGNOUT DONE")
                    }), trailing: Button("B", action: {
                        goLogin = true
                    }))
                /*
                NavigationLink(
                    destination: LoginView(),
                    isActive: $goLogin,
                    label: {
                        EmptyView()
                    })
                */
                
                NavigationLink(
                    destination: SelectListView(doneSelectingList: {
                            todolistVM.loadList()
                    }),
                    label: {
                        Text("Välj lista")
                    })
                
                HStack {
                    TextField("", text: $itemName).padding()
                    Button(action: {
                        todolistVM.addItem(itemname: itemName)
                    }) {
                        Text("Add")
                    }.padding()
                }
                
                
                List(todolistVM.currentList.items) { todoitem in
                    
                    NavigationLink(
                        destination: TodoDetailView(currentItem: todoitem, letsLoadList: {
                            todolistVM.loadList()
                        }),
                        label: {
                            Text(todoitem.itemname)
                        })
                    
                    
                }.listStyle(PlainListStyle())
            }
            
            
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
                    
                    todolistVM.loadList()
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

