//
//  DetailsUserViewController.swift
//  TakeHome
//
//  Created MACBOOK on 21/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import SVProgressHUD

// MARK: Presenter Interface
protocol DetailsUserPresentationLogic: AnyObject {
    /// Fetches data successfully and performs appropriate actions upon success.
    /// Use this function to handle scenarios where data fetching completes successfully.
    /// Typically, you might update the UI, process the received data to tableview
    @MainActor func fetchDataSuccessFully(model: DetailsUserModel)
    
    /// Use this function to handle scenarios where an error occurs while fetching data.
    /// Typically, log the error, show an error message alert to the user,
    @MainActor func fetchDataError(error: String)
    ///show loading indicator
    func showLoading()
    /// hide loading indicator
    func hideLoading()
}

// MARK: View
class DetailsUserViewController: UIViewController {
    var interactor: DetailsUserInteractorLogic!
    var router: DetailsUserRoutingLogic!
    
    @IBOutlet weak var numberFollowerLabel: UILabel!
    @IBOutlet weak var numberFollwingLabel: UILabel!
    @IBOutlet weak var DetailsUserView: DetailsUser!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        interactor.getUserFollowingAndFollowerUser()
    }
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
        router.popViewController()
    }
    
    // MARK: Fetch DetailsUser
    private func fetchDataOnLoad() {
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        DetailsUserView.setupView(model: interactor.userDetailsModel)
    }
    
    private func setupFollowerAndFollowingLabel(model: DetailsUserModel) {
        self.numberFollowerLabel.text = String(model.numberFollowrer)
        self.numberFollwingLabel.text = String(model.numberFollowing)
        
    }
}

// MARK: Connect View, Interactor, and Presenter
extension DetailsUserViewController: DetailsUserPresentationLogic {
    func fetchDataSuccessFully(model: DetailsUserModel) {
        setupFollowerAndFollowingLabel(model: model)
        DetailsUserView.setLocationValue(value: model.location)
    }
    
    func fetchDataError(error: String) {
        self.showAlert(title: "Notification", message: error)
    }
    
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }

}
