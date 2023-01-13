# coredata_custom-class_Transformer_example

### Room+CoreDataClass

```swift
import Foundation
import CoreData

@objc(Room)
public class Room: NSManagedObject {
    
}

```

### Room+CoreDataProperties

```swift
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
```

### UIColorTransformer

```swift
import Foundation
import UIKit

class UIColorTransformer: ValueTransformer {
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }
        let data = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
        return data
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
        return color
    }
    
}

```

### CoreDataManager
```swift
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

```
