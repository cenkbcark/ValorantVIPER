//
//  DetailPresenter.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

protocol DetailPresenterProtocol {
    var agent: AgentDataResponse? { get set }
    var view: DetailModule.View? { get set }
    var interactor: DetailModule.Interactor? { get set }
    var router: DetailModule.Router? { get set }
    
    func updateView()
}

final class DetailPresenter: DetailPresenterProtocol {
    var agent: AgentDataResponse?
    
    var view: DetailModule.View?
    var interactor: DetailModule.Interactor?
    var router: DetailModule.Router?
    
    init(agentData: AgentDataResponse) {
        self.agent = agentData
    }
    
    func updateView() {
        guard let agent = agent
        else { return }
        view?.updateView(with: agent)
    }
}
