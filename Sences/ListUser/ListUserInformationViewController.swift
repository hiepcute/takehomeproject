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
    
}

extension ListUserInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
