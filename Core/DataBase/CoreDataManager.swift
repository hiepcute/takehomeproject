//
//  CoreDataManager.swift
//  TakeHome
//
//  Created by MACBOOK on 22/12/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserEntity")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func deleteAllUsers() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "UserEntity") // Tên entity của bạn
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
            print("All users have been deleted.")
        } catch {
            print("Failed to delete users: \(error)")
        }
    }
}
