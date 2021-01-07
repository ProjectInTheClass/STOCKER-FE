//
//  HomeController.swift
//  ExForWony
//
//  Created by 정원영 on 2021/01/06.
//

import UIKit
import Charts
import TinyConstraints


class HomeController: UIViewController, ChartViewDelegate {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lineChartView)
        lineChartView.centerInSuperview()
        lineChartView.width(to: view)
        lineChartView.heightToWidth(of: view)
        
        setData()
    }
    
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
    func setData() {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
