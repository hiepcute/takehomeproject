//
//  CoreDataRepository.swift
//  TakeHome
//
//  Created by MACBOOK on 22/12/24.
//

import Foundation
import CoreData

class UserRepository {
    private let context: NSManagedObjectContext

    // Initialize UserRepository with the Core Data context
    init(context: NSManagedObjectContext) {
        self.context = context
    }

    // Save users to Core Data with order
    func saveUsers(_ users: [UserInformationModel]) throws {
        for (index, user) in users.enumerated() {
            let userEntity = UserEntity(context: context)
            userEntity.login = user.login
            userEntity.avatar_url = user.avatar_url
            userEntity.order = Int16(index) // Assign order for each user
        }
        
        do {
            try context.save()
        } catch {
            throw error // Propagate the error if saving fails
        }
    }

    // Fetch users from Core Data and sort them by order
    func fetchUsers() throws -> [UserEntity] {
        let fetchRequest: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()

        // Sort by 'order' to ensure the correct order
        let sortDescriptor = NSSortDescriptor(key: "order", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        do {
            // Return the sorted users
            return try context.fetch(fetchRequest)
        } catch {
            throw error // Propagate the error if fetching fails
        }
    }
}
