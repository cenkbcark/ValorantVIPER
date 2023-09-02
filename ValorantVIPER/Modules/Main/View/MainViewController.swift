//
//  MainViewController.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import UIKit

protocol MainViewProtocol {
    var presenter: MainModule.Presenter? { get set }
    func updateTableView(with model: [MainModule.MainTableItem])
}

final class MainViewController: UIViewController, MainViewProtocol {
    
    @IBOutlet private weak var tableView: UITableView!
    var presenter: MainModule.Presenter?
    
    private var dataSource: MainDataSource!
    private var tableItems: [MainModule.MainTableItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupDataSource()
    }
    
    private func setupDataSource() {
        dataSource = .init(tableView)
        dataSource.presenter = presenter
    }
    
    func updateTableView(with model: [MainModule.MainTableItem]) {
        tableItems = model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MainViewController {
    func updateProductTableView(_ model: [MainModule.MainTableItem]) {
        dataSource.presenter = presenter
        dataSource.setItems(model)
    }
}
