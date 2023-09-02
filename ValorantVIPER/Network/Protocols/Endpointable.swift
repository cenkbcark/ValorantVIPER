//
//  Endpointable.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

protocol Endpointable {
    var baseUrl: String { get }
    var fullPath: String { get }
    var rawValue: String { get }
}
