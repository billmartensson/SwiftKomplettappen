//
//  InviteView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI

struct InviteView: View {
    var body: some View {
        VStack {
            Text("INVITE REQUESTS")
            List {
                HStack {
                    Text("Min lista")
                    Text("Torsten")
                    Spacer()
                    Button(action: {}) {
                        Text("Approve")
                    }
                    Button(action: {}) {
                        Text("Deny")
                    }
                }
            }
        }
    }
}

struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView()
    }
}
