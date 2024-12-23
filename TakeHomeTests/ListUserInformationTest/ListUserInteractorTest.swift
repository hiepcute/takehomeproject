@testable import TakeHome
import XCTest

class ListUserInformationInteractorTests: XCTestCase {
    
    // Mocks
    var mockWorker: MockListUserInformationWorker!
    var mockPresenter: MockListUserViewController!
    var mockRouter: MockListUserRouter!
    private let mockUser = UserInformationModel(login: "testUser", avatar_url: "test.com")
    var interactor: ListUserInformationInteractor!
    
    override func setUp() {
        super.setUp()
        
        // Initialize mocks
        mockWorker = MockListUserInformationWorker()
        mockPresenter = MockListUserViewController()
        mockRouter = MockListUserRouter()
        
        // Initialize interactor with the mock worker
        interactor = ListUserInformationInteractor(withWorker: mockWorker)
        interactor.presenter = mockPresenter
        interactor.router = mockRouter
    }
    
    override func tearDown() {
        mockWorker = nil
        mockPresenter = nil
        mockRouter = nil
        interactor = nil
        
        super.tearDown()
    }
    
    // MARK: - Test Cases
    func test_LoadUserData_WithLocalData_UpdatesModel() async {
        // Given
        let localUsers = [mockUser]
        mockWorker.loadUserDataFromLocalResult = .success(localUsers)
        
        // When
        interactor.loadUserData()
        interactor.updateModel(model: localUsers)
        // Then
        XCTAssertTrue(mockPresenter.showLoadingCalled)
        XCTAssertEqual(interactor.model, localUsers)
    }
    
    
    func test_LoadUserData_WithEmptyLocal_FetchesFromAPI() async {
        // Given
        let apiUsers = [mockUser]
        mockWorker.loadUserDataFromLocalResult = .success([])
        mockWorker.fetchUserInformationResult = .success(apiUsers)
        
        // When
        interactor.loadUserData()
        interactor.updateModel(model: apiUsers)
        // Then
        let exp = expectation(description: "API Fetch")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(self.mockPresenter.showLoadingCalled)
            XCTAssertTrue(self.mockPresenter.hideLoadingCalled)
            XCTAssertTrue(self.mockWorker.saveUserDataCalled)
            XCTAssertEqual(self.interactor.model, apiUsers)
            exp.fulfill()
        }
        await fulfillment(of: [exp], timeout: 1)
    }
    
    func test_LoadUserData_WithAPIError_ShowsError() async {
        // Given
        mockWorker.loadUserDataFromLocalResult = .success([])
        mockWorker.fetchUserInformationResult = .failure(.invalidResponse)
        
        // When
        interactor.loadUserData()
        
        // Then
        let exp = expectation(description: "Error Handling")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(self.mockPresenter.showLoadingCalled)
            XCTAssertTrue(self.mockPresenter.hideLoadingCalled)
            XCTAssertTrue(self.mockPresenter.fetchDataErrorCalled)
            exp.fulfill()
        }
        await fulfillment(of: [exp], timeout: 1)
    }
    
    func test_LoadUserData_WithAPIError_DecodingFailed_ShowsError() async {
        // Given
        mockWorker.loadUserDataFromLocalResult = .success([])
        mockWorker.fetchUserInformationResult = .failure(.decodingFailed)
        
        // When
        interactor.loadUserData()
        
        // Then
        let exp = expectation(description: "Error Handling")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(self.mockPresenter.showLoadingCalled)
            XCTAssertTrue(self.mockPresenter.hideLoadingCalled)
            XCTAssertTrue(self.mockPresenter.fetchDataErrorCalled)
            exp.fulfill()
        }
        await fulfillment(of: [exp], timeout: 1)
    }
    
}
