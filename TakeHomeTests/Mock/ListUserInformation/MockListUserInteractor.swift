//
//  MockListUserInteractor.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import Foundation
@testable import TakeHome

final class MockListUserInteractor: ListUserInformationInteractorLogic {
    private(set) var loadUserDataCalledCount = 0
    var model: [UserInformationModel] = []
    func loadUserData() {
        loadUserDataCalledCount += 1
    }
}
