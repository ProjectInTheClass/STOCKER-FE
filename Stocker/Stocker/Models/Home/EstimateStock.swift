//  GET /home/estimatestock

import Foundation

struct StockList : Codable {
    let stockCode : String
    let stockName : String
    let stockPrice : Float
    let stockEstimatePrice : Float
}

struct Revenue {
    let lastRevenue : Float
    let cumRevenue : Float
}

struct EstimateStock : Codable {
    let stockList : [StockList]
    let lastRevenue : Float
    let cumRevenue : Float
}
