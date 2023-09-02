//
//  DetailInteractor.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailModule.Presenter? { get set }
}

final class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailModule.Presenter?
    
}
