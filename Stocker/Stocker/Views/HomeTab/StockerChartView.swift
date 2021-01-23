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
        chartView.backgroundColor = .systemBackground
        chartView.rightAxis.enabled = false
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(6, force: false)
        yAxis.labelTextColor = #colorLiteral(red: 0.3574229479, green: 0.4851229191, blue: 0.9726678729, alpha: 1)
        yAxis.axisLineColor = #colorLiteral(red: 0.3574229479, green: 0.4851229191, blue: 0.9726678729, alpha: 1)
        yAxis.labelPosition = .outsideChart
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 12)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.labelTextColor = #colorLiteral(red: 0.3574229479, green: 0.4851229191, blue: 0.9726678729, alpha: 1)
        chartView.xAxis.axisLineColor = .black
        

        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }()
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setUp(_ yValues : [ChartDataEntry]) {
        self.addSubview(self.lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.height(300)
        lineChartView.width(to: self)
        setData(yValues)
    }
    
    func setChartLimitLine(_ estimatePrice : Double){
        let ll = ChartLimitLine(limit: estimatePrice, label: "예측값")
        lineChartView.leftAxis.addLimitLine(ll)
    }

    func setData(_ yValues : [ChartDataEntry] ) {
        let set1 = LineChartDataSet(entries: yValues, label: "시간")
        set1.mode = .cubicBezier
        set1.drawCirclesEnabled = false
        set1.lineWidth = 2
        set1.setColor(#colorLiteral(red: 0.3574229479, green: 0.4851229191, blue: 0.9726678729, alpha: 1))
        set1.fill = Fill(color: #colorLiteral(red: 0.3574229479, green: 0.4851229191, blue: 0.9726678729, alpha: 1))
        set1.fillAlpha = 0.5
        set1.drawFilledEnabled = true
        set1.drawHorizontalHighlightIndicatorEnabled = false
        set1.highlightColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        set1.highlightLineWidth = 2
        
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        lineChartView.data = data
    }
}
