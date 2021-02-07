//
//  DataAPI.swift
//  Stocker
//
//  Created by koalakid on 2021/01/13.
//

import Foundation
import Alamofire

class DataAPI {
    
    static let shared = DataAPI()
    
    func getPastData(completion: @escaping (Result<PastStockDataResponse,Error>) -> Void) {
        let decoder = JSONDecoder()
        
        AF.request("http://everysports.iptime.org:5000/data/pastdata").responseData(completionHandler: {response in
            switch response.result {
            case .success(let data):
                do {
                    let pastData = try decoder.decode(PastStockDataResponse.self, from: data)
                    completion(.success(pastData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
