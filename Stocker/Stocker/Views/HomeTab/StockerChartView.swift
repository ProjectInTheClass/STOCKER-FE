//
//  LineChart.swift
//  ExForWony
//
//  Created by 정원영 on 2021/01/07.
//

import UIKit
import Charts
import TinyConstraints

class StockerChartView: UIView, ChartViewDelegate {
    
    lazy var lineChartView : LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemBlue
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = .white
        yAxis.axisLineColor = .white
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = .white
        chartView.xAxis.axisLineColor = .systemBlue
        
        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }()
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setUp(_ yValues : [ChartDataEntry]) {
        self.addSubview(self.lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: self)
        lineChartView.heightToWidth(of: self)
        setData(yValues)
    }
    
    func setData(_ yValues : [ChartDataEntry] ) {
        let set1 = LineChartDataSet(entries: yValues, label: "Subscrivers")
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 3
        set1.setColor(.white)
        set1.fill = Fill(color: .white)
        set1.fillAlpha = 0.8
        set1.drawFilledEnabled = true
        
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = .systemRed
        set1.highlightLineWidth = 2
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
    }
}
