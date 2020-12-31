//
//  DataViewModel.swift
//  iot_ios
//
//  Created by Tuan Son Nguyen on 31/12/20.
//

import Foundation

class DataViewModel: ObservableObject{
    
    @Published var data: DataModel?
    private var timer: Timer?
    
    init() {
        self.fetchData() { result in
            self.data = result
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            self.fetchData() { result in
                self.data = result
            }
        }
    }
    
    func fetchData(completion: @escaping (DataModel) -> Void) {
        let temperature = Int.random(in: 19..<30)
        let humidity = Int.random(in: 29..<40)
        let timestamp = DataViewModel.getCurrentTimeString()
        completion(DataModel(temperature: temperature, humidity: humidity, timestamp: timestamp))
    }
    
    static func getCurrentTimeString() -> String {
        let currentDateTime = Date()
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm:ss, d MMM y"
        
        return formatter3.string(from: currentDateTime)
    }
}

struct DataModel {
    var temperature: Int
    var humidity: Int
    var timestamp: String
}
