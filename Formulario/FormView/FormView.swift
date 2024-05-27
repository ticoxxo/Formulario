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
    
    enum FormEnum: Hashable {
        case firstName
        case lastName
        case address(value: addressEnum)
        case address2(value: addressEnum)
        case user
        case password
    }
    
    enum addressEnum {
        case street
        case city
        case postal
    }
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var address = Address()
    @State private var toggle2years = false
    @State private var address2 = Address()
    @State private var user = ""
    @State private var password = ""
    @FocusState private var currentFocus: FormEnum?
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Nombre") {
                    TextField("First name", text: $firstName)
                        .focused($currentFocus, equals: .firstName)
                        .submitLabel(.next)
                    TextField("Last name", text: $lastName)
                        .focused($currentFocus, equals: .lastName)
                        .submitLabel(.next)
                }
                
                Section("Current address") {
                    TextField("Street address", text: $address.street)
                        .focused($currentFocus, equals: FormEnum.address(value: .street))
                        .submitLabel(.next)
                    TextField("City", text: $address.city)
                        .focused($currentFocus, equals: FormEnum.address(value: .city))
                        .submitLabel(.next)
                    TextField("Postal Code", text: $address.postalCode)
                        .focused($currentFocus, equals: FormEnum.address(value: .postal))
                        .submitLabel(.next)
                    Toggle( isOn: $toggle2years) {
                        Text("Have you lived there the last 2 years?")
                    }
                }
                
                if toggle2years {
                    Section("Previous address") {
                        TextField("Street address", text: $address2.street)
                            .focused($currentFocus, equals: FormEnum.address2(value: .street))
                            .submitLabel(.next)
                        TextField("City", text: $address2.city)
                            .focused($currentFocus, equals: FormEnum.address2(value: .city))
                            .submitLabel(.next)
                        TextField("Postal Code", text: $address2.postalCode)
                            .focused($currentFocus, equals: FormEnum.address2(value: .postal))
                            .submitLabel(.next)
                    }
                }
                
                Section {
                    TextField("Create user", text: $user )
                        .focused($currentFocus, equals: .user)
                        .submitLabel(.next)
                    TextField("Create password", text: $password)
                        .focused($currentFocus, equals: .password)
                        .submitLabel(.done)
                }
                Button("Submit") {
                    print("Form submit action here")
                }
                .disabled(isDisabled())
                
            }
            .onSubmit {
                switch currentFocus {
                case .firstName:
                    currentFocus = .lastName
                case .lastName:
                    currentFocus = .address(value: .street)
                case .address(value: .street) :
                    currentFocus = .address(value: .city)
                case .address(value: .city) :
                    currentFocus = .address(value: .postal)
                case .address(value: .postal) :
                    currentFocus = toggle2years ? .address2(value: .street) : .user
                case .address2(value: .street) :
                    currentFocus = .address2(value: .city)
                case .address2(value: .city) :
                    currentFocus = .address2(value: .postal)
                case .address2(value: .postal) :
                    currentFocus = .user
                case .user :
                    currentFocus = .password
                default:
                    print("Thanks for the address buddy")
                }
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
