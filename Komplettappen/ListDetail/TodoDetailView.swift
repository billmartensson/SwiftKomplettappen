//
//  TodoDetailView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI

struct TodoDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var currentItem = TODOItem()
    var letsLoadList = {}
    
    @State var tempName = "ABC"
    
    var body: some View {
        VStack {
            Text("TODO DETAIL")
            
            TextField("Title", text: $tempName)
        
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            
            
            Button(action: {
                //currentItem.itemname = tempName
                //currentItem.save()
                
                print("CLOSE DETAIL")
                letsLoadList()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
            }.padding()
        }.onAppear() {
            tempName = currentItem.itemname
        }
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView()
    }
}
