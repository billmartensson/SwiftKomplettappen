//
//  TODOList.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-12-03.
//

import Foundation
import Firebase

struct TODOList : Identifiable
{
    var id = ""
    var invitecode = ""
    var owner = ""
    var listtitle : String
    
    var items = [TODOItem]()
    
    func save()
    {
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        // TODO: generera invitecode
        var listsavedata = ["invitecode": "xyz123", "owner": Auth.auth().currentUser!.uid, "title": listtitle]
        
        ref.child("komplettappen").child("lists").childByAutoId().setValue(listsavedata)
    }
    
    func addItem(itemname : String)
    {
        
    }
    
    func loadItems()
    {
        
    }
}
