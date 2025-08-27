//
//  WeatherRepository.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation

protocol WeatherRepository {
    func fetchWeatherDetails(for city: String) async throws -> Weather
    func fetchForecast(for city: String) async throws -> Forecast
}
