//
//  MainRouter.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import UIKit


protocol MainRouterProtocol {
    func navigateToDetail(with model: AgentDataResponse)
}

final class MainRouter: MainRouterProtocol {
    weak var presenterVC: UIViewController?
    
    func navigateToDetail(with model: AgentDataResponse) {
        let detailVC = DetailBuilder.build(with: model)
        UIApplication.topViewController()?.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
