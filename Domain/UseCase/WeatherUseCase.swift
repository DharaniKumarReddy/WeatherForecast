//
//  WeatherUseCase.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation

protocol WeatherUseCase {
    func getWeatherData(city: String) async throws -> Weather
    func getForecastData(city: String) async throws -> Forecast
}

final class WeatherUseCaseImpl: WeatherUseCase {
    
    private let repository: WeatherRepository
    
    init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    func getWeatherData(city: String) async throws -> Weather {
        try await repository.fetchWeatherDetails(for: city)
    }
    
    func getForecastData(city: String) async throws -> Forecast {
        try await repository.fetchForecast(for: city)
    }
}
