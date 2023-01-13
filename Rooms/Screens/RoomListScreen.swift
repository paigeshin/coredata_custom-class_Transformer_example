//
//  ContentView.swift
//  MovieApp
//
//  Created by Mohammad Azam on 2/23/21.
//

import SwiftUI

struct RoomListScreen: View {
    
    @StateObject private var roomListVM = RoomListViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            
            List(self.roomListVM.rooms, id: \.roomId) { room in
                HStack {
                    Text(room.name)
                    Spacer()
                    HStack {
                        
                    }
                    .frame(width: 50, height: 50)
                    .background(Color(room.color))
                }
            }.listStyle(PlainListStyle())
            
            .navigationTitle("All Rooms")
            .navigationBarItems(trailing: Button("Add New Room") {
                isPresented = true
            })
            .onAppear(perform: {
                self.roomListVM.populateRooms()
            })
            
            .sheet(isPresented: $isPresented, onDismiss: {
                self.roomListVM.populateRooms()
            } ,content: {
                AddRoomScreen()
            })
            
        }
    }
}

struct RoomListScreen_Previews: PreviewProvider {
    static var previews: some View {
        RoomListScreen()
    }
}
