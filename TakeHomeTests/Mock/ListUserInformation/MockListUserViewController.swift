//
//  MockListUserViewController.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import Foundation
@testable import TakeHome

class MockListUserViewController: ListUserInformationPresentationLogic {
    
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var fetchDataSuccessFullyCalled = false
    var fetchDataErrorCalled = false
    var fetchDataErrorMessage: String?
    
    // Properties to test the router
    var navigationToDetailsCalled = false
    var navigationToDetailsViewModel: UserDetailsViewModel?

    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
    
    func fetchDataSuccessFully() {
        fetchDataSuccessFullyCalled = true
    }
    
    func fetchDataError(error: String) {
        fetchDataErrorCalled = true
        fetchDataErrorMessage = error
    }
    
    // Method to simulate navigationToDetailsViewcontroller call
    func navigationToDetailsViewcontroller(userDetailModel: UserDetailsViewModel) {
        navigationToDetailsCalled = true
        navigationToDetailsViewModel = userDetailModel
    }
}

