//
//  MainBuilder.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import UIKit

final class MainBuilder {
    
    private init() { }
    
    static func build() -> UIViewController {
        let nibName = String(describing: MainViewController.self)
        let mainServiceManager = AlamofireServiceManager()//URLSessionServiceManager()
        
        let view = MainViewController(nibName: nibName, bundle: .main)
        let interactor = MainInteractor(serviceMAnager: mainServiceManager)
        let presenter = MainPresenter()
        let router = MainRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        router.presenterVC = view
        return view
    }
}
