//  GET /home/estimatestock

import Foundation
import Charts

struct StockList : Codable {
    let stockCode : String
    let stockName : String
    let stockPrice : Double
    let stockEstimatePrice : Double
}

struct Revenue {
    let lastRevenue : Double
    let cumRevenue : Double
}

struct EstimateStock : Codable {
    let stockList : [StockList]
    let lastRevenue : Double
    let cumRevenue : Double
}

struct CurrentData {
    var lastTime : Double
    var lastPrice : [Double]
}

struct ChartData : Codable {
    var lastTime : Double
    var lastPrice : [Double]
}

struct StockerEstimate {
    let stockCode : String
    let stockName : String
    let stockPrice : Double
    let stockEstimatePrice : Double
    var lastTime : Double
    var lastPrice : [Double]
    var parsedLastPrice : [ChartDataEntry]
}
