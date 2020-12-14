//
//  SignupView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI
import Firebase

struct SignupView: View {
    
    @Binding var loginPresentation : PresentationMode
    
    @State var enteredEmail = ""
    @State var enteredPassword = ""
    
    var userLoginOk = {}
    
    var body: some View {
        VStack {
            Text("SIGNUP")
            
            // TODO: Email fält
            TextField("E-mail", text: $enteredEmail).padding()
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                
            // TODO: Lösenordsfält
            SecureField("Password", text: $enteredPassword).padding()
                    
            
            Button(action: {
                
                
                Auth.auth().createUser(withEmail: enteredEmail, password: enteredPassword, completion: { signupresult, signuperror in
                    if(signuperror == nil)
                    {
                        //TODO: Gå till start
                        // OK SIGNUP
                        print("OK SIGNUP")
                        userLoginOk()
                        loginPresentation.dismiss()
                    } else {
                        //TODO: Visa felmeddelande
                        // FAIL SIGNUP
                        print("FAIL SIGNUP")
                        print(signuperror?.localizedDescription)
                    }
                })
                
            }) {
                Text("Signup")
            }.padding()
            
            Spacer()
        }
    }
}

/*
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        
        SignupView()
    }
}
*/
