//
//  Room+CoreDataProperties.swift
//  Rooms
//
//  Created by paige shin on 2023/01/13.
//

import Foundation
import CoreData
import UIKit

extension Room {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }
    
    @NSManaged public var name: String
    @NSManaged public var length: Double
    @NSManaged public var width: Double
    @NSManaged public var color: UIColor?
    
}

extension Room: Identifiable {
    
}
