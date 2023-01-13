//
//  CoreDataManager.swift
//  Rooms
//
//  Created by paige shin on 2023/01/13.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private var viewContext: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    init() {
        
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColor"))
        
        self.persistentContainer = NSPersistentContainer(name: "RoomModel")
        self.persistentContainer.loadPersistentStores { desc, error in
            if let error {
                print(error.localizedDescription)
                fatalError("Failed to load Core Data")
            }
        }
    }
    
    func getAllRooms() -> [Room] {
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        do {
            return try self.viewContext.fetch(fetchRequest)
        } catch {
            return [] 
        }
    }
    
    func save() {
        do {
            try self.viewContext.save()
        } catch {
            self.viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
}
