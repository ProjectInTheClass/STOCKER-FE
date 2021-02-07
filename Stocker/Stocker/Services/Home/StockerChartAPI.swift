//
//  StockerEstimateAPI.swift
//  Stocker
//
//  Created by 정원영 on 2021/01/21.
//

import Foundation
import Alamofire

class StockerChartAPI {
    static let shared = StockerChartAPI()
    
    func getStockerChartData(stockCode : String ,completion : @escaping (Result<ChartData, Error>) -> Void){
        let decoder = JSONDecoder()
        let url = "http://everysports.iptime.org:5000/home/currentdata/"
        
        AF.request(url+stockCode).responseData(completionHandler: { respone in
            switch respone.result{
            case .success(let data):
                do{
                    let chartData : ChartData = try decoder.decode(ChartData.self, from: data)
                    completion(.success(chartData))
                } catch{
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
