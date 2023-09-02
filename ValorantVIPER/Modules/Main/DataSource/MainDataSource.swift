//
//  MainDataSource.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 2.09.2023.
//

import UIKit

final class MainDataSource: NSObject {
    typealias RowItem = MainModule.MainTableItem
    
    weak var tableView: UITableView?
    weak var presenter: MainModule.Presenter?
    
    private var items: [RowItem] = []
    
    required init(_ tableView: UITableView) {
        super.init()
        self.tableView = tableView
        registerCells()
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = 10
        self.tableView?.separatorStyle = .none
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    private func registerCells() {
        let iconCellName = String(describing: IconCell.self)
        let iconCellNib = UINib(nibName: iconCellName, bundle: .main)
        tableView?.register(iconCellNib, forCellReuseIdentifier: iconCellName)
        
        let descriptionCellName = String(describing: DescriptionCell.self)
        let descriptionCellNib = UINib(nibName: descriptionCellName, bundle: .main)
        tableView?.register(descriptionCellNib, forCellReuseIdentifier: descriptionCellName)
        
        let categorySegmentedCellName = String(describing: CategorySegmentedCell.self)
        let categorySegmentedCellNib = UINib(nibName: categorySegmentedCellName, bundle: .main)
        tableView?.register(categorySegmentedCellNib, forCellReuseIdentifier: categorySegmentedCellName)
        
        let agentCellName = String(describing: AgentItemCell.self)
        let agentCellNib = UINib(nibName: agentCellName, bundle: .main)
        tableView?.register(agentCellNib, forCellReuseIdentifier: agentCellName)
    }
    
}
extension MainDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let tabItem = presenter?.tableItems.count
        else { return 0 }
        return tabItem
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableSection = presenter?.tableItems[section]
        else { return 0 }
        
        switch tableSection {
        case .logo:
            return 1
        case .description:
            return 1
        case .categorySegmented:
            return 1
        case .agents(model: let model):
            return model.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableSection = presenter?.tableItems[indexPath.section]
        else { return UITableViewCell() }
        
        switch tableSection {
        case .logo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IconCell.self)) as? IconCell {
                return cell
            }
        case .description:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionCell.self)) as? DescriptionCell {
                return cell
            }
        case .categorySegmented:
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CategorySegmentedCell.self)) as? CategorySegmentedCell {
                return cell
            }
        case .agents(model: let agents):
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AgentItemCell.self)) as? AgentItemCell {
                cell.prepareAgentCell(with: agents[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension MainDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableItems = presenter?.tableItems[indexPath.section]
        else { return }
        switch tableItems {
        case .agents(model: let agents):
            presenter?.didSelectedAgent(with: agents[indexPath.row])
        default:
            break
        }
    }
}
extension MainDataSource {
    
    func setItems(_ items: [RowItem]) {
        self.items = items
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
}
