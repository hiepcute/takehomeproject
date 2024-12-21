//
//  ListUserInformationViewController.swift
//  TakeHome
//
//  Created MACBOOK on 19/12/24.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import SVProgressHUD

// MARK: Presenter Interface
protocol ListUserInformationPresentationLogic: AnyObject {
    /// Fetches data successfully and performs appropriate actions upon success.
    /// Use this function to handle scenarios where data fetching completes successfully.
    /// Typically, you might update the UI, process the received data to tableview
    func fetchDataSuccessFully()
    
    /// Use this function to handle scenarios where an error occurs while fetching data.
    /// Typically, log the error, show an error message alert to the user,
    func fetchDataError()
    ///show loading indicator
    func showLoading()
    /// hide loading indicator
    func hideLoading()
}

// MARK: View
class ListUserInformationViewController: UIViewController {
    var interactor: ListUserInformationInteractorLogic!
    var router: ListUserInformationRoutingLogic!
    
    @IBOutlet var titleLabel: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch ListUserInformation
    private func fetchDataOnLoad() {
        interactor.fetchUser()
    }
    
    
    
    // MARK: SetupUI
    private func setupView() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension ListUserInformationViewController: ListUserInformationPresentationLogic {
    func showLoading() {
        SVProgressHUD.show()
    }
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func fetchDataSuccessFully() {
        
    }
    
    func fetchDataError() {
        
    }
    
    
}

extension ListUserInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
