//
//  MainPresenter.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    var view: MainModule.View? { get set }
    var interactor: MainModule.Interactor? { get set }
    var router: MainModule.Router? { get set }
    var tableItems: [MainModule.MainTableItem] { get set }

    func viewDidLoad()
    func didFetchAgents(with model: [AgentDataResponse])
    func didSelectedAgent(with model: AgentDataResponse)
    func fetchError()
}

final class MainPresenter: MainPresenterProtocol {
    
    var view: MainModule.View?
    var interactor: MainModule.Interactor?
    var router: MainModule.Router?
    var tableItems: [MainModule.MainTableItem] = []
    
    func viewDidLoad() {
        interactor?.fetchAgents()
    }
    
    func didFetchAgents(with model: [AgentDataResponse]) {
        tableItems.append(.logo)
        tableItems.append(.description)
        tableItems.append(.categorySegmented)
        tableItems.append(.agents(model: model))
        view?.updateTableView(with: tableItems)
    }
    
    func didSelectedAgent(with model: AgentDataResponse) {
        router?.navigateToDetail(with: model)
    }
    
    func fetchError() {
        
    }
}
