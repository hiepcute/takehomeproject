import XCTest
import CoreData
@testable import TakeHome

final class ListUserInformationWorkerTests: XCTestCase {
    private var sut: ListUserInformationWorker!
    private var mockRepository: MockUserRepository!
    private var mockNetworkService: MockNetworkService!
    private var context: NSManagedObjectContext!
    
    // Test data
    private let testUsers = [
        UserInformationModel(login: "test1", avatar_url: "https://test1.com"),
        UserInformationModel(login: "test2", avatar_url: "https://test2.com")
    ]
    
    override func setUp() {
        super.setUp()
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mockRepository = MockUserRepository(context: context)
        mockNetworkService = MockNetworkService()
        sut = ListUserInformationWorker(
            userRepository: mockRepository,
            networkService: mockNetworkService
        )
    }
    
    override func tearDown() {
        sut = nil
        mockRepository = nil
        mockNetworkService = nil
        context = nil
        super.tearDown()
    }
    
    func test_FetchUserInformation_Success() async throws {
        // Given
        let expectedUsers = testUsers
        mockNetworkService.mockUsers = expectedUsers as [UserInformationModel]
        
        // When
        let result = try await sut.fetchUserInformation(url: "https://api.test.com")
        
        // Then
        XCTAssertEqual(result.count, expectedUsers.count)
        XCTAssertEqual(result[0].login, expectedUsers[0].login)
    }
    
    func test_LoadUserDataFromLocal_Success() throws {
        // Given
        try mockRepository.saveUsers(testUsers)
        
        // When
        let result = try sut.loadUserDataFromLocal()
        
        // Then
        XCTAssertEqual(result.count, testUsers.count)
        XCTAssertEqual(result[0].login, testUsers[0].login)
    }
    
    func test_SaveUserData_Success() {
        // When/Then
        XCTAssertNoThrow(try sut.saveUserData(testUsers))
    }
}
