//
//  ListUserInformationViewController.swift
//  TakeHome
//
//  Created MACBOOK on 19/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol ListUserInformationPresentationLogic: AnyObject {
    
}

// MARK: View
class ListUserInformationViewController: UIViewController {
    var interactor: ListUserInformationInteractorLogic!
    var router: ListUserInformationRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch ListUserInformation
    private func fetchDataOnLoad() {
      
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        view.backgroundColor = .red
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension ListUserInformationViewController: ListUserInformationPresentationLogic {
    
}
