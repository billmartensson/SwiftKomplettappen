//
//  SelectListView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI

struct SelectListView: View {
    var body: some View {
        VStack {
            Text("SELECT LIST")
            
            TextField("List name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            
            Button(action: {}) {
                Text("Add")
            }
            
            List {
                Text("My list 1")
                Text("My list 2")
                Text("My list 3")
            }

        }
    }
}

struct SelectListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectListView()
    }
}
