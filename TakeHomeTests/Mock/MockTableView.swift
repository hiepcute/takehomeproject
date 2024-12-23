//
//  MockTableView.swift
//  TakeHomeTests
//
//  Created by MACBOOK on 23/12/24.
//

import UIKit
@testable import TakeHome

final class MockTableView: UITableView {
    var reloadDataCalledCount = 0
    
    override func reloadData() {
        reloadDataCalledCount += 1
    }
}
