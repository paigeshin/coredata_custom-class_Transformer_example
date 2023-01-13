//
//  ContentView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import SwiftUI

struct AddRoomScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @StateObject private var addRoomVM = AddRoomViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Enter room", text: self.$addRoomVM.name)
                    TextField("Enter width", text: self.$addRoomVM.width)
                    TextField("Enter length", text: self.$addRoomVM.length)
                    ColorPicker("Select color", selection: self.$addRoomVM.color)
                    
                    HStack {
                        Spacer()
                        Button("Save") {
                            self.addRoomVM.saveRoom()
                            self.presentation.wrappedValue.dismiss()
                        }
                        Spacer()
                    }

                }
            }
            .navigationTitle("Add Room")
        }
    }
}

struct AddRoomScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddRoomScreen()
    }
}
