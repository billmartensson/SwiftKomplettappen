//
//  TODOItem.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-12-03.
//

import SwiftUI
import Foundation
import Firebase

struct TODOItem : Identifiable
{
    var id = ""
    var todolistid = ""
    var itemname = ""
    var itemdescription = ""
    
    var itemdone = false
    
    func save()
    {
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        var itemsavedata = ["itemname": itemname]
        
        var savePlace = ref.child("komplettappen").child("listitems").child(todolistid)
        
        if(id == "")
        {
            savePlace = savePlace.childByAutoId()
        } else {
            savePlace = savePlace.child(id)
        }
        
        savePlace.setValue(itemsavedata) { (error:Error?, ref:DatabaseReference) in
            
        }
    }
}
