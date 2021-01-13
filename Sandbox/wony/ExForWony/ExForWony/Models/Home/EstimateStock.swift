//
//  EstimateStock.swift
//  ExForWony
//
//  Created by 정원영 on 2021/01/13.
//

import Foundation

struct EstimateStock : Codable {
    var stockerList : [Stock]
    var lastRevenue : Float
}
