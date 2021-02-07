//
//  RevenueAPI.swift
//  Stocker
//
//  Created by 정원영 on 2021/01/20.
//

import Foundation
import Alamofire

class StockListAPI {
    static let shared = StockListAPI()
    
    func getStockListData(completion : @escaping (Result<[StockList], Error>) -> Void) {
        let decoder = JSONDecoder()
        let url = "http://everysports.iptime.org:5000/home/estimatestock"
        
        AF.request(url).responseData(completionHandler: { response in
            switch response.result {
                case .success(let data):
                    do {
                        let estimateStock : EstimateStock = try decoder.decode(EstimateStock.self, from: data)
                        completion(.success(estimateStock.stockList))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
            }
        })
    }
}
