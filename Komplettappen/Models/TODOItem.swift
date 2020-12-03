//
//  TODOItem.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-12-03.
//

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
        
        ref.child("komplettappen").child("listitems").child(todolistid).childByAutoId().setValue(itemsavedata)
    }
}
