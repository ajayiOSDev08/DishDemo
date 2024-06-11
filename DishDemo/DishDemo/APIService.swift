//
//  APIService.swift
//  DishDemo
//
//  Created by CEL-MGMT-IT on 11/06/24.
//

import Foundation

class APIService {
    
    private static let baseURL = "https://www.themealdb.com/api/json/v2/1/randomselection.php"
    
    private static func createRequestURL() -> URLRequest? {
        
        guard let url = URL(string: baseURL) else {
            print("Invalid URL string")
            return nil
        }
        
        return URLRequest(url: url)
    }
    
    public static func fetchDishes(completion: @escaping (Result<DishModel, Error>) -> Void) {
        guard let urlRequest = createRequestURL() else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let model = try JSONDecoder().decode(DishModel.self, from: data)
                completion(.success(model))
            } catch {
                print("Invalid data")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
