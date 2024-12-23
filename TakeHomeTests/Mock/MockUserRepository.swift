//
//  MockUserRepository.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import Foundation
import CoreData
@testable import TakeHome

class MockUserRepository: UserRepository {
    
    // This will store data in memory for testing purposes
    private var mockUsers: [UserEntity] = []
    
    override init(context: NSManagedObjectContext) {
        // For the mock, we can just pass an empty context or mock context
        super.init(context: context)
    }
    
    // Mock the `saveUsers` method to store users in the mockUsers array
    override func saveUsers(_ users: [UserInformationModel]) throws {
        // Simulate saving users to the mock in-memory store
        for user in users {
            let userEntity = UserEntity(context: context)
            userEntity.login = user.login
            userEntity.avatar_url = user.avatar_url
            userEntity.order = Int16(mockUsers.count) // Assign order based on count
            mockUsers.append(userEntity)
        }
    }
    
    // Mock the `fetchUsers` method to return users from the mock in-memory store
    override func fetchUsers() throws -> [UserEntity] {
        // Return the users in memory, sorted by order
        return mockUsers.sorted { $0.order < $1.order }
    }
}
