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
   @MainActor func fetchDataSuccessFully()
    
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
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
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
        self.tableView.reloadData()
    }
    
    func fetchDataError() {
        
    }
    
}

extension ListUserInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        let modelInteractor = interactor.model[indexPath.row]
        let model = UserCellModel(imageViewURL: modelInteractor.avatar_url, name: modelInteractor.login)
        cell.setupData(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
