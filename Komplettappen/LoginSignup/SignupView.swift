//
//  SignupView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI
import Firebase

struct SignupView: View {
    
    @State var enteredEmail = ""
    @State var enteredPassword = ""
    
    
    var body: some View {
        VStack {
            Text("SIGNUP")
            
            // TODO: Email fält
            TextField("E-mail", text: $enteredEmail).padding()
            
            // TODO: Lösenordsfält
            TextField("Password", text: $enteredPassword).padding()
            
            Button(action: {
                Auth.auth().createUser(withEmail: enteredEmail, password: enteredPassword, completion: { signupresult, signuperror in
                    if(signuperror == nil)
                    {
                        //TODO: Gå till start
                        // OK SIGNUP
                        print("OK SIGNUP")
                    } else {
                        //TODO: Visa felmeddelande
                        // FAIL SIGNUP
                        print("FAIL SIGNUP")
                    }
                })
            }) {
                Text("Signup")
            }.padding()
            
            Spacer()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
