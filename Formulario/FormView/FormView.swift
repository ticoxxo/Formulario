//
//  FormView.swift
//  Formulario
//
//  Created by Alberto Almeida on 24/05/24.
//

import SwiftUI

struct Address {
    var street: String = ""
    var city: String = ""
    var postalCode: String = ""
}

struct Formulario: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var toggle2years = false
    @State private var address2 = Address()
    @State private var user = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Nombre") {
                    TextField("First name", text: $firstName)
                    TextField("Last name", text: $lastName)
                }
                
                Section("Current address") {
                    TextField("Street address", text: $address.street)
                    TextField("City", text: $address.city)
                    TextField("Postal Code", text: $address.postalCode)
                    Toggle( isOn: $toggle2years) {
                        Text("Have you lived there the last 2 years?")
                    }
                }
                
                if toggle2years {
                    Section("Previous address") {
                        TextField("Street address", text: $address2.street)
                        TextField("City", text: $address2.city)
                        TextField("Postal Code", text: $address2.postalCode)
                    }
                }
                
                Section {
                    TextField("Create user", text: $user )
                    TextField("Create password", text: $password)
                }
                Button("Submit") {
                    print("Form submit action here")
                }
                .disabled(isDisabled())
                
            }
            .navigationTitle("Sing up")
        }
    }
    
    func isDisabled() -> Bool {
        
        return firstName.isEmpty || lastName.isEmpty || address.postalCode.isEmpty || address.street.isEmpty || address.city.isEmpty || user.isEmpty || password.isEmpty ? true : false
    }
}

#Preview {
    Formulario()
}
