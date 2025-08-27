//
//  APIConfig.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

struct APIConfig {
    
    let baseURL: URL
    let apiKey: String
    let units: String
    
    init(baseURL: URL,
         apiKey: String,
         units: String = "metric"
    ) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.units = units
    }
    
}
