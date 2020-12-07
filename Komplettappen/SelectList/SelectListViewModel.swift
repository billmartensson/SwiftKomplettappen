//
//  SelectListViewModel.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-12-03.
//

import Foundation
import Firebase

class SelectListViewModel : ObservableObject
{
    @Published var todolists = [TODOList]()
    
    func loadLists()
    {
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        // TODO: Hämta listor inbjuden till
        ref.child("komplettappen").child("lists").queryOrdered(byChild: "owner").queryEqual(toValue: Auth.auth().currentUser!.uid).observeSingleEvent(of: .value, with: { snapshot in
            
            var tempTodoArray = [TODOList]()
            for snapchild in snapshot.children
            {
                let childsnapshot = snapchild as! DataSnapshot
                
                let childdict = childsnapshot.value as! [String : String]
                
                var tempTodo = TODOList(listtitle: childdict["title"]!)
                tempTodo.id = childsnapshot.key
                tempTodo.invitecode = childdict["invitecode"]!
                tempTodo.owner = childdict["owner"]!
                
                tempTodoArray.append(tempTodo)
            }
            self.todolists = tempTodoArray
            
        })
    }
    
}
