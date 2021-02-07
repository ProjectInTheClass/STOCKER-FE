//
//  RevenueAPI.swift
//  Stocker
//
//  Created by 정원영 on 2021/01/20.
//

import Foundation
import Alamofire

class RevenueAPI {
    static let shared = RevenueAPI()
    
    func getRevenueData(completion : @escaping (Result<EstimateStock, Error>) -> Void) {
        let decoder = JSONDecoder()
        let url = "http://everysports.iptime.org:5000/home/estimatestock"
        
        AF.request(url).responseData(completionHandler: { response in
            switch response.result {
                case .success(let data):
                    do {
                        let estimateStock : EstimateStock = try decoder.decode(EstimateStock.self, from: data)
                        completion(.success(estimateStock))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
}
