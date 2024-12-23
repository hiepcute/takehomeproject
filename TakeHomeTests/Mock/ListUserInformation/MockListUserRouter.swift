//
//  MockListUserRouter.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import Foundation
@testable import TakeHome

final class MockListUserRouter: ListUserInformationRoutingLogic {
    private(set) var navigationToDetailsViewcontrollerCalledCount = 0
    private(set) var passedUserDetailModel: UserDetailsViewModel?
    func navigationToDetailsViewcontroller(userDetailModel: UserDetailsViewModel) {
        navigationToDetailsViewcontrollerCalledCount += 1
        passedUserDetailModel = userDetailModel
    }
    
}
