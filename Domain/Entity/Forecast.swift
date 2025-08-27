//
//  Forecast.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation

struct Forecast {
    let city: String
    let list: [Entry]
    
    struct Entry: Identifiable {
        let id: Int
        var date: Date
        let temperature: Double
        let description: String
    }
}
