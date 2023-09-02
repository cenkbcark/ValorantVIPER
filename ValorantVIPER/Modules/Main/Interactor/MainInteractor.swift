//
//  MainInteractor.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

protocol MainInteractorProtocol {
    var presenter: MainModule.Presenter? { get set }
    
    func fetchAgents()
}

final class MainInteractor: MainInteractorProtocol {
    var presenter: MainModule.Presenter?
    
    private var serviceManager: Networkable
    
    init(serviceMAnager: Networkable) {
        self.serviceManager = serviceMAnager
    }
    
    func fetchAgents() {
        let mainEndpoint: MainEndpoint = .agents
        let mainParameter: MainParameter = .language("tr-TR")
        serviceManager.fetchData(endpoint: mainEndpoint, parameters: [mainParameter]) { (result: Result<AgentResponseModel, Error>) in
            switch result {
            case .success(let success):
                guard let agents = success.data
                else { return }
                self.presenter?.didFetchAgents(with: agents)
            case .failure(_):
                self.presenter?.fetchError()
            }
        }
    }
}
