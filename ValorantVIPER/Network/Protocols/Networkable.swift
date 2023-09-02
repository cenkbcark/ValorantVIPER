//
//  Networkable.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import Foundation

protocol Networkable {
    func fetchData<T: Decodable>(endpoint: Endpointable, parameters: [Parameterable]?, completion: @escaping (Result<T, Error>) -> Void)
}
