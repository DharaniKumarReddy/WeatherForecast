//
//  ForecastResponseModel.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation

struct ForecastResponseModel: Decodable {
    let city: City
    let list: [List]
    
    struct City: Decodable {
        let name: String
        let sunrise: Int
        let sunset: Int
    }
    
    struct List: Decodable {
        let dt: Int
        let main: Main
        let weather: [Weather]
        let dtTxt: String
        
        
        
        struct Main: Decodable {
            let temp: Double
        }
        
        struct Weather: Decodable {
            let description: String
        }
    }
}
