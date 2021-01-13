//
//  PastStockData.swift
//  Stocker
//
//  Created by koalakid on 2021/01/13.
//

import Foundation
import UIKit


struct pastStockDataResponse: Codable {
    var weekData: [weekStockData]
    var cumRevenue: Int
}

struct weekStockData: Codable {
    var weakIndex: String
    var StockList: [pastStock]
}

struct pastStock: Codable {
    let stockCode: String
    let stockName: String
    var stockPrice: Double
    var stockEstimatePrice: Double
}
