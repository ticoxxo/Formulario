//
//  LoginView.swift
//  Formulario
//
//  Created by Alberto Almeida on 27/05/24.
//

import SwiftUI

struct Login: View {
    @State private var user = ""
    @State private var pass = ""
    
    var body: some View {
        VStack {
            Text("Mochink")
                        .fontWeight(.heavy)
                        .foregroundStyle(.blue)
                        .font(.largeTitle)
                        .padding(.bottom, 30)
            Image(systemName: "person.circle")
                .font(.system(size: 150))
                .foregroundStyle(.gray)
                .padding(.bottom, 40)
            Group {
                TextField("Username", text: $user)
                SecureField("Password", text: $pass)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
            Button {
                print("Login tapped")
            } label: {
                Text("Login")
            }
            .padding()
            .background((user.isEmpty || pass.isEmpty) ? .gray : .blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .disabled(user.isEmpty || pass.isEmpty)
        }.padding()
    }
}

#Preview {
    Login()
}
