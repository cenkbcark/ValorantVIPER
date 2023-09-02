//
//  MainModule.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

struct MainModule {
    typealias View = MainViewProtocol
    typealias Interactor = MainInteractorProtocol
    typealias Presenter = MainPresenterProtocol
    typealias Router = MainRouterProtocol
}

extension MainModule {
    enum MainTableItem {
        case logo
        case description
        case categorySegmented
        case agents(model: [AgentDataResponse])
    }
}

