//
//  EditProfileView.swift
//  EverybodyEats
//
//  Created by Ahad Islam on 4/21/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import SwiftUI

protocol EditProfileViewDelegate: AnyObject {
    func didPressSaveButton(name: String?, city: String?, bio: String?, allergy: String?)
}

struct EditProfileView: View {
    
    enum Allergen: String, CaseIterable {
        case milk = "Milk"
        case eggs = "Eggs"
        case fish = "Fish"
        case shellfish = "Shellfish"
        case treenuts = "Tree Nuts"
        case peanuts = "Peanuts"
        case wheat = "Wheat"
        case soy = "Soy"
    }
    
    @State private var displayName: String = ""
    @State private var city: String = ""
    @State private var bio: String = ""
    @State private var allergy = 1
    private let allergies = Allergen.allCases.map { $0.rawValue }
    
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
                    Section {
                        HStack {
                            Text("Bio").padding(.trailing)
                            TextField("Bio", text: $bio)
                        }
                    }
                    Section {
                        Picker("Allergies",
                               selection: $allergy) {
                                ForEach(0..<allergies.count) {
                                    Text(self.allergies[$0]).tag($0)
                                }
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
        delegate?.didPressSaveButton(name: displayName, city: city, bio: bio, allergy: allergies[allergy])
        self.dismiss?()
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
