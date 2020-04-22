//
//  EditProfileView.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import SwiftUI

protocol EditProfileViewDelegate: AnyObject {
    func didPressSaveButton(name: String?, city: String?)
}

struct EditProfileView: View {
    @State private var displayName: String = ""
    @State private var city: String = ""
    
    var dismiss: (() -> Void)?
    
    weak var delegate: EditProfileViewDelegate?
    
        
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        EmptyView()
                    }
                    Section {
                        HStack {
                            Text("Name").padding(.trailing)
                            TextField("Display Name", text: $displayName)
                        }
                    }
                    Section {
                        HStack {
                            Text("City").padding(.trailing)
                            TextField("City", text: $city)
                        }
                    }
                }
                Button(action: saveButtonPressed) {
                    HStack {
                        Spacer()
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .padding(.vertical, 10.0)
                .background(Color.red)
                .cornerRadius(20)
                .padding(.horizontal, 50.0)
                .padding(.bottom)
            }
            .navigationBarTitle("Edit Info")
        }
    }
    
    init(displayName name: String?, city: String?, delegate: EditProfileViewDelegate) {
        self.displayName = name ?? "name"
        self.city = city ?? "city"
        self.delegate = delegate
    }
    
    init() {}
    
    private func saveButtonPressed() {
        delegate?.didPressSaveButton(name: displayName, city: city)
        self.dismiss?()
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
