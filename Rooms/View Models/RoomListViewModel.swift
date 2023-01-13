//
//  RoomListViewModel.swift
//  Rooms
//
//  Created by paige shin on 2023/01/13.
//

import Foundation
import UIKit

class RoomListViewModel: ObservableObject {
    
    let coreDM: CoreDataManager
    
    @Published var rooms: [RoomViewModel] = []
    
    init() {
        self.coreDM = CoreDataManager.shared
    }
    
    func populateRooms() {
        DispatchQueue.main.async {
            self.rooms = self.coreDM.getAllRooms().map(RoomViewModel.init)
        }
    }
    
}

struct RoomViewModel {
    
    let room: Room
    
    var roomId: ObjectIdentifier {
        return self.room.id
    }
    
    var color: UIColor {
        return self.room.color ?? UIColor.clear
    }
    
    var name: String {
        return self.room.name
    }
    
}
