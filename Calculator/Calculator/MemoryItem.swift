//
//  MemoryItem.swift
//  Calculator
//
//  Created by Miia Romanainen on 19.4.2021.
//

import Foundation
import CoreData

public class MemoryItem: NSManagedObject, Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension MemoryItem {
    static func getAllMemoryItems() -> NSFetchRequest<MemoryItem> {
        let request:NSFetchRequest<MemoryItem> = MemoryItem.fetchRequest()as!
        NSFetchRequest<MemoryItem>
        
        let sortDesriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDesriptor]
        
        return request
    }
    
}
