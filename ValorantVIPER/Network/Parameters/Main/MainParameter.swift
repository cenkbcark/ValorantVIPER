//
//  MainParameter.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

enum MainParameter: Parameterable {
    case language(String)
    
    var queryItem: URLQueryItem {
        switch self {
        case .language(let language):
            return URLQueryItem(name: "language", value: language)
        }
    }
}
