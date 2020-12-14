//
//  SelectListView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI

struct SelectListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var selectListVM = SelectListViewModel()
    
    @State var listname = ""
    
    var doneSelectingList = {}
    
    var body: some View {
        VStack {
            Text("SELECT LIST")
            
            TextField("List name", text: $listname)
            
            Button(action: {
                
                var newTODO = TODOList(listtitle: listname)
                
                newTODO.save()
                selectListVM.loadLists()
            }) {
                Text("Add")
            }
            
            List(selectListVM.todolists) { todolist in
                Text(todolist.listtitle).onTapGesture {
                    UserDefaults.standard.setValue(todolist.id, forKey: "currentListId")
                    
                    doneSelectingList()
                    
                    presentationMode.wrappedValue.dismiss()
                }
            }

        }.onAppear() {
            selectListVM.loadLists()
        }
    }
}

struct SelectListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectListView()
    }
}
