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
    var cumRevenue: Float
}

struct weekStockData: Codable {
    var weekIndex: String
    var stockList: [pastStock]
}

struct pastStock: Codable {
    var stockCode: String
    var stockName: String
    var stockMaxPrice: Float
    var stockEstimatePrice: Float
}
