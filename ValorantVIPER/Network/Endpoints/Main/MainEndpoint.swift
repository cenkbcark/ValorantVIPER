//
//  MainEndpoint.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

enum MainEndpoint: Endpointable {
    case agents
    
    var baseUrl: String {
        return "https://valorant-api.com/v1"
    }
    
    var fullPath: String {
        return baseUrl + self.rawValue
    }
    
    var rawValue: String {
        switch self {
        case .agents: return "/agents"
        }
    }
}
