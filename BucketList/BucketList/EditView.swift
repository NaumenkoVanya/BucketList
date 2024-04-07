//
//  EditView.swift
//  BucketList
//
//  Created by Ваня Науменко on 7.04.24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    var location: LocationOne
    @State private var name: String
    @State private var description: String
    var onSave: (LocationOne) -> Void
    
    
    init(location: LocationOne, onSave: @escaping (LocationOne) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
   
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Descripton", text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar{
                Button("Save"){
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    EditView(location: .example) {_ in}
}
