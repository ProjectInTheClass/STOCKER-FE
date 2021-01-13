//
//  LineChartData.swift
//  ExForWony
//
//  Created by 정원영 on 2021/01/07.
//

import Foundation
import Charts
import TinyConstraints

class LineChartDatas {
    static let shared = LineChartData()
    
    let yValues: [ChartDataEntry] = [
        ChartDataEntry(x: 0.0, y: 10.0),
        ChartDataEntry(x: 1.0, y: 5.0),
        ChartDataEntry(x: 2.0, y: 7.0),
        ChartDataEntry(x: 3.0, y: 15.0),
        ChartDataEntry(x: 4.0, y: 10.0),
        ChartDataEntry(x: 5.0, y: 6.0),
        ChartDataEntry(x: 6.0, y: 4.0),
        ChartDataEntry(x: 7.0, y: 7.0),
        ChartDataEntry(x: 8.0, y: 8.0),
        ChartDataEntry(x: 9.0, y: 3.0),
        ChartDataEntry(x: 10.0, y: 7.0),
        ChartDataEntry(x: 11.0, y: 1.0),
        ChartDataEntry(x: 12.0, y: 6.0),
        ChartDataEntry(x: 13.0, y: 9.0),
        ChartDataEntry(x: 14.0, y: 4.0),
        ChartDataEntry(x: 15.0, y: 7.0),
        ChartDataEntry(x: 16.0, y: 2.0),
        ChartDataEntry(x: 17.0, y: 8.0),
        ChartDataEntry(x: 18.0, y: 2.0),
        ChartDataEntry(x: 19.0, y: 8.0),
        ChartDataEntry(x: 20.0, y: 6.0),
        ChartDataEntry(x: 21.0, y: 10.0),
        ChartDataEntry(x: 22.0, y: 5.0),
        ChartDataEntry(x: 23.0, y: 7.0),
        ChartDataEntry(x: 24.0, y: 15.0),
        ChartDataEntry(x: 25.0, y: 10.0),
        ChartDataEntry(x: 26.0, y: 6.0),
        ChartDataEntry(x: 27.0, y: 4.0),
        ChartDataEntry(x: 28.0, y: 7.0),
        ChartDataEntry(x: 29.0, y: 8.0),
        ChartDataEntry(x: 30.0, y: 3.0),
        ChartDataEntry(x: 31.0, y: 7.0),
        ChartDataEntry(x: 32.0, y: 1.0),
        ChartDataEntry(x: 33.0, y: 6.0),
        ChartDataEntry(x: 34.0, y: 9.0),
        ChartDataEntry(x: 35.0, y: 4.0),
        ChartDataEntry(x: 36.0, y: 7.0),
        ChartDataEntry(x: 37.0, y: 2.0),
        ChartDataEntry(x: 38.0, y: 8.0),
        ChartDataEntry(x: 39.0, y: 2.0),
        ChartDataEntry(x: 40.0, y: 8.0),
        ChartDataEntry(x: 41.0, y: 6.0),
    ]
    
    func getData(completion : ([ChartDataEntry]) -> Void){
        completion(self.yValues)
    }
}
