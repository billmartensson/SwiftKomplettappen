//
//  LoginView.swift
//  Komplettappen
//
//  Created by Bill Martensson on 2020-11-30.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var enteredEmail = ""
    @State var enteredPassword = ""
    
    @State var showError = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("LOGIN")
                
                if(showError)
                {
                    Text("Felaktig inloggning")
                        .padding()
                        .background(Color.red)
                }
                
                
                TextField("E-mail", text: $enteredEmail).padding()
                
                TextField("Password", text: $enteredPassword).padding()
                
                Button(action: {
                    Auth.auth().signIn(withEmail: enteredEmail, password: enteredPassword, completion: { loginresult, loginerror in
                        if(loginerror == nil)
                        {
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            // TODO: Visa felmeddelande
                            showError = true
                        }
                    })
                    
                }) {
                    Text("Login")
                }.padding()
                
                NavigationLink(
                    destination: SignupView(),
                    label: {
                        Text("SIGNUP")
                    })
                
                Spacer()

            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
