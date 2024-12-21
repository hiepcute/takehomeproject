//
//  DetailsUserViewController.swift
//  TakeHome
//
//  Created MACBOOK on 21/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol DetailsUserPresentationLogic: AnyObject {
    
}

// MARK: View
class DetailsUserViewController: UIViewController {
    var interactor: DetailsUserInteractorLogic!
    var router: DetailsUserRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: Fetch DetailsUser
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension DetailsUserViewController: DetailsUserPresentationLogic {
    
}
