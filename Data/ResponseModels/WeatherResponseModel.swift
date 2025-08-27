//
//  WeatherResponseModel.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation

struct WeatherResponseModel: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let visibility: Int
    let timezone: Int
    
    struct Main: Decodable {
        let temp: Double
    }
    
    struct Weather: Decodable {
        let description: String
    }
}
