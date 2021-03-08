//
//  ToDoItem.swift
//  CoreDataToDo
//
//  Created by Miia Romanainen on 8.3.2021.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable{
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest()as!
        NSFetchRequest<ToDoItem>
        
        let sortDesriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDesriptor]
        
        return request
    }
    
}
