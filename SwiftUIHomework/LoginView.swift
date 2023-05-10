//
//  LoginView.swift
//  SwiftUIHomework
//
//  Created by Aleksandr Derevyanko on 10.05.2023.
//

import SwiftUI

struct LoginView: View {
    @Binding var logged: Bool
    
    @State private var login: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea(edges: .top)
            
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(80)
                    .shadow(radius: 12)
                    .padding(.top, 20)
                
                VStack(spacing: -0.5) {
                    TextField("Login", text: $login)
                        .modifier(TextFielder())
                    SecureField("Password", text: $password)
                        .modifier(TextFielder())
                }
                .cornerRadius(12)
                .padding(.top, 60)
                .padding(16)
                
                Button(action: {
                    self.logged = true
                }) {
                    Text("Log In")
                        .frame(height: 50)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color(.systemBlue))
                .cornerRadius(12)
                .padding(16)
                
                Spacer()
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(logged: .constant(false))
    }
}
