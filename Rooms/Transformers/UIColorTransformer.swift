//
//  UIColorTransformer.swift
//  Rooms
//
//  Created by paige shin on 2023/01/13.
//

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
