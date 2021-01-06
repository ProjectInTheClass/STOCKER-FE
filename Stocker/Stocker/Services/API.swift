import Foundation

struct Stock {
    let stockCode: String
    let stockName: String
    var stockPrice: Double
    var stockEstimatePrice: Double
}

class API {
    //Singleton
    //Swift의 함수타입(클로저)
    //Swift completion handler
    static let shared = API()
    var items: [Stock] = [
        Stock(stockCode: "123456", stockName: "삼성전자", stockPrice: 85321, stockEstimatePrice: 82314),
        Stock(stockCode: "353425", stockName: "LG화학", stockPrice: 34511, stockEstimatePrice: 234324),
        Stock(stockCode: "569768", stockName: "한화생명", stockPrice: 45744652, stockEstimatePrice: 1234314),
        Stock(stockCode: "746469", stockName: "셀트리온", stockPrice: 12341324, stockEstimatePrice: 6884884),
        Stock(stockCode: "314133", stockName: "SK하이닉스", stockPrice: 135415, stockEstimatePrice: 46425654),
    ]
    
    func hello()   {
        print("Hello")
    }
    
    func getMenuItems(completion : ( ([Stock]) -> Void ) ) {

        completion(self.items)
    }
}
