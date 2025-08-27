//
//  WeatherRepositoryImpl.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation

class WeatherRepositoryImpl: WeatherRepository {
    
    private let dataSource: WeatherRemoteDataSource
    
    init(dataSource: WeatherRemoteDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchWeatherDetails(for city: String) async throws -> Weather {
        return try await dataSource.current(city: city)
    }
    
    func fetchForecast(for city: String) async throws -> Forecast {
        return try await dataSource.forecast(city: city)
    }
}
