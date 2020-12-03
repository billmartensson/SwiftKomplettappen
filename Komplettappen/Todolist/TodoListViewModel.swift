//
//  TodoListViewModel.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-12-03.
//

import Foundation
import Firebase

class TodoListViewModel : ObservableObject
{
    @Published var currentList = TODOList(listtitle: "")
    
    func loadList()
    {
        guard let savedList = UserDefaults.standard.string(forKey: "currentListId") else {
            return
        }
        
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        // TODO: Hämta bara användarens listor
        ref.child("komplettappen").child("lists").child(savedList).observeSingleEvent(of: .value, with: { snapshot in
            
            
            let tododict = snapshot.value as! [String : String]
            
            var tempTodo = TODOList(listtitle: tododict["title"]!)
            tempTodo.id = snapshot.key
            tempTodo.invitecode = tododict["invitecode"]!
            tempTodo.owner = tododict["owner"]!
            
            self.currentList = tempTodo
            print("LADDAT LISTA")
            self.loadListItems()
        })
        
        
        
    }
    
    func loadListItems()
    {
        guard let savedList = UserDefaults.standard.string(forKey: "currentListId") else {
            return
        }
        
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        
        ref.child("komplettappen").child("listitems").child(savedList).observeSingleEvent(of: .value, with: { snapshot in
            
            var tempTodoArray = [TODOItem]()
            for snapchild in snapshot.children
            {
                let childsnapshot = snapchild as! DataSnapshot
                
                let childdict = childsnapshot.value as! [String : String]
                
                var tempTodo = TODOItem()
                tempTodo.id = childsnapshot.key
                tempTodo.itemname = childdict["itemname"]!
                
                tempTodoArray.append(tempTodo)
            }
            self.currentList.items = tempTodoArray
            print("LADDAT ITEMS")
        })
    }
    
    func addItem(itemname : String)
    {
        var tempItem = TODOItem()
        tempItem.todolistid = currentList.id
        tempItem.itemname = itemname
        
        tempItem.save()
        
        loadListItems()
    }
    
}
