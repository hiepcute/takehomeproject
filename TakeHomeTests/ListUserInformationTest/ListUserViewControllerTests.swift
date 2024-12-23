//
//  ListUserViewControllerTests.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import XCTest
@testable import TakeHome

final class ListUserViewControllerTests: XCTestCase {
    private var viewController: ListUserInformationViewController!
    private var mockInteractor: MockListUserInteractor!
    private var mockRouter: MockListUserRouter!
        
    override func setUp() {
        self.setupInitViewcontroller()
        super.setUp()
    }
    
    private func setupInitViewcontroller() {
        viewController = ListUserInformationConfigurator.viewcontroller()
        mockInteractor = MockListUserInteractor()
        mockRouter = MockListUserRouter()
        viewController.interactor = mockInteractor
        viewController.router = mockRouter
    }
    
    override func tearDown() {
        viewController = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }
    
    func testLoadNibFile_whenLoadView_ShouldNotBeNil() {
        // then
        XCTAssertNotNil(viewController, "ViewController should not be nil")
        XCTAssertNotNil(viewController.view, "View should not be nil")
    }
    
    func testLoadIBOutlet_whenLoadView_ShouldConnectAndNotNil() {
        //when
        viewController.loadViewIfNeeded()

        //then
        XCTAssertNotNil(viewController.titleLabel, "titleLabel should not be nil")
        XCTAssertNotNil(viewController.tableView, "tableView should not be nil")
    }
    
    func testFetchDataOnLoad_WhenLoadView_ShouldCallCount() {  
        // when
        viewController.loadViewIfNeeded()
        
        //then
        XCTAssertEqual(mockInteractor.loadUserDataCalledCount, 1)
    }
    
    func testSetupTableView_WhenLoadView_ShouldNotBeNilAndDelegateToViewController() {
        // when
        viewController.loadViewIfNeeded()
        
        //then
        XCTAssertNotNil(viewController.tableView.delegate, "TableView delegate should be set.")
        XCTAssertNotNil(viewController.tableView.dataSource, "TableView dataSource should be set.")
        XCTAssertTrue(viewController.tableView.delegate === viewController, "TableView delegate should be the view controller.")
        XCTAssertTrue(viewController.tableView.dataSource === viewController, "TableView dataSource should be the view controller.")
        XCTAssertNotNil(viewController.tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier), "TableView should have registered the UserTableViewCell.")
    }
    
    
    @MainActor  func testFetchDataSuccessFully_WhenLoadView_ReloadsTableView() {
        // Given
        let mockTableView = MockTableView()
        viewController.tableView = mockTableView
        
        // When
        viewController.fetchDataSuccessFully()
        
        // Then
        XCTAssertEqual(mockTableView.reloadDataCalledCount, 1, "fetchDataSuccessFully should reload the table view")
    }
      
    
    func test_TableView_CellForRow_ShouldReturnTypeOfCell() {
        // Given
        let mockData = [
            UserInformationModel(login: "User1", avatar_url: "https://example.com/user1")
        ]
        mockInteractor.model = mockData
        viewController.loadViewIfNeeded()
        viewController.tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
       
        // When
        let cell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertTrue(cell is UserTableViewCell, "The dequeued cell should be of type UserTableViewCell")
    }
    
    func testTableView_NumberOfRows_shouldReturnNumberRow() {
        // Arrange
        let mockData = [
            UserInformationModel(login: "User1", avatar_url: "https://example.com/user1"),
            UserInformationModel(login: "User2", avatar_url: "https://example.com/user2")
        ]
        mockInteractor.model = mockData
        viewController.loadViewIfNeeded()
        // Act
        let rows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        
        // Assert
        XCTAssertEqual(rows, mockData.count, "Number of rows should match the count of interactor.model")
    }
    
    func testDidSelectRowAtTableView_WhenViewLoad_ShouldCallNavigation() {
        // Given
        let mockUser = UserInformationModel(login: "TestUser", avatar_url: "https://testurl.com/avatar.jpg")
        mockInteractor.model = [mockUser]
        
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        
        viewController.loadViewIfNeeded()
        viewController.tableView(viewController.tableView, didSelectRowAt: indexPath)
        
        //Then
        XCTAssertEqual(mockRouter.navigationToDetailsViewcontrollerCalledCount, 1, "navigationToDetailsViewcontroller should be called")
        XCTAssertEqual(mockRouter.passedUserDetailModel?.imageViewURL, "https://testurl.com/avatar.jpg")
        XCTAssertEqual(mockRouter.passedUserDetailModel?.name, "TestUser")
    }
       
}
