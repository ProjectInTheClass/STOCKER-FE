//
//  PastStockData.swift
//  Stocker
//
//  Created by koalakid on 2021/01/13.
//

import Foundation
import UIKit


struct PastStockDataItem {
    var weekData: WeekStockData
    var selected: Bool
}

struct PastStockDataResponse: Codable {
    var weekData: [WeekStockData]
//    var cumRevenue: Float
}

struct WeekStockData: Codable {
    var weekIndex: String
    var stockList: [PastStock]
}

struct PastStock: Codable {
    var stockCode: String
    var stockName: String
    var stockMaxPrice: Float
    var stockEstimatePrice: Float
}
