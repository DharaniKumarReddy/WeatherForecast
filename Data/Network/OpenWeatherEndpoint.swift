//
//  OpenWeatherEndpoint.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

enum OpenWeatherEndpoint: EndPoint {
    case currentWeather(city: String)
    case forecast(city: String)
    
    var path: String {
        switch self {
        case .currentWeather:
            "/data/2.5/weather"
        case .forecast:
            "/data/2.5/forecast"
        }
    }
    
    var method: HTTPMethod { .GET}
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .currentWeather(let city),
                .forecast(city: let city):
            let qValue = city.trimmingCharacters(in: .whitespacesAndNewlines)
            return [URLQueryItem(name: "q", value: qValue)]
        }
    }
    
    
}
