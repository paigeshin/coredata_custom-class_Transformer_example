//
//  AddRoomViewModel.swift
//  Rooms
//
//  Created by paige shin on 2023/01/13.
//

import Foundation
import SwiftUI

class AddRoomViewModel: ObservableObject {
    
    let coreDM: CoreDataManager

    var name: String = ""
    var width: String = ""
    var length: String = ""
    var color: Color = Color.clear
    
    init() {
        self.coreDM = CoreDataManager.shared
    }
    
    func saveRoom() {
        let room = Room(context: self.coreDM.persistentContainer.viewContext)
        room.name = self.name
        room.width = Double(self.width) ?? 0.0
        room.length = Double(self.length) ?? 0.0
        room.color = UIColor(self.color)
        
        self.coreDM.save()
    }
    
}
