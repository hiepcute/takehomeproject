//
//  abc.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import Foundation
import XCTest
import CoreData

@testable import TakeHome

final class UserRepositoryTests: XCTestCase {
    var sut: UserRepository!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        context = createInMemoryContext()
        sut = UserRepository(context: context)
    }
    
    override func tearDown() {
        sut = nil
        context = nil
        super.tearDown()
    }
    
    func testSaveAndFetchUsers() throws {
        // Given
        let users = [
            UserInformationModel(login: "user1", avatar_url: "url1"),
            UserInformationModel(login: "user2", avatar_url: "url2")
        ]
        
        // When
        try sut.saveUsers(users)
        let fetchedUsers = try sut.fetchUsers()
        
        // Then
        XCTAssertEqual(fetchedUsers.count, 2)
        XCTAssertEqual(fetchedUsers[0].login, "user1")
        XCTAssertEqual(fetchedUsers[1].login, "user2")
    }
    
    func testOrderPreservation() throws {
        // Given
        let users = [
            UserInformationModel(login: "user1", avatar_url: "url1"),
            UserInformationModel(login: "user2", avatar_url: "url2")
        ]
        
        // When
        try sut.saveUsers(users)
        let fetchedUsers = try sut.fetchUsers()
        
        // Then
        XCTAssertEqual(fetchedUsers[0].order, 0)
        XCTAssertEqual(fetchedUsers[1].order, 1)
    }
    
    // MARK: - Helpers
    
    private func createInMemoryContext() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        try! persistentStoreCoordinator.addPersistentStore(
            ofType: NSInMemoryStoreType,
            configurationName: nil,
            at: nil,
            options: nil
        )
        
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCoordinator
        return context
    }
}
