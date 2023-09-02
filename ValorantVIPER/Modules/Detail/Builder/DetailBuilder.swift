//
//  DetailBuilder.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import UIKit

final class DetailBuilder {
    
    private init() { }
    
    static func build(with agent: AgentDataResponse) -> UIViewController {
        let nibName = String(describing: DetailViewController.self)
        let view = DetailViewController(nibName: nibName, bundle: .main)
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(agentData: agent)
        let router = DetailRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        router.presenterVC = view
        return view
    }
}
