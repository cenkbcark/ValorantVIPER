//
//  AlamofireServiceManager.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 2.09.2023.
//

import Alamofire
import Foundation

final class AlamofireServiceManager: Networkable {
    func fetchData<T>(endpoint: Endpointable, parameters: [Parameterable]?, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        var components = URLComponents(string: endpoint.baseUrl + endpoint.rawValue)
        if let parameters = parameters {
            components?.queryItems = parameters.map({ $0.queryItem })
        }
        
        guard let url = components?.url
        else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0)))
            return
        }
        
        AF.request(url).response { response in
            guard let data = response.data
            else {
                completion(.failure(NSError(domain: "No data received", code: 0)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
