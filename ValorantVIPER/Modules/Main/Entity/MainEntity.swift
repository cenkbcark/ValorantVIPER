//
//  MainEntity.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

struct AgentResponseModel: Decodable {
    let status: Int?
    let data: [AgentDataResponse]?
}

struct AgentDataResponse: Decodable {
    let uuid: String?
    let displayName: String?
    let description: String?
    let fullPortrait: String?
    let background: String?
    let backgroundGradientColors: [String]?
    let role: AgentRoleResponse?
    let abilities: [AgentAbilitiesResponse]?
    let voiceLine: AgentVoiceLineResponse?
}

struct AgentRoleResponse: Decodable {
    let uuid: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
}

struct AgentAbilitiesResponse: Decodable {
    let slot: String?
    let displayName: String?
    let description: String?
    let displayIcon: String?
}

struct AgentVoiceLineResponse: Decodable {
    let mediaList: [AgentMediaListResponse]?
}

struct AgentMediaListResponse: Decodable {
    let id: Int?
    let wave: String?
}
