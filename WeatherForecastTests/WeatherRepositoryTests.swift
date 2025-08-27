//
//  WeatherRepositoryTests.swift
//  WeatherForecastTests
//
//  Created by Dharani Reddy on 27/08/25.
//

import XCTest
@testable import WeatherForecast

final class WeatherRepositoryTests: XCTestCase {

    class MockWeatherRemoteDataSource: WeatherRemoteDataSource {
        var weatherResponse: Weather?
        var forecastResponse: Forecast?
        
        func current(city: String) async throws -> Weather {
            guard let response = weatherResponse else {
                throw URLError(.badServerResponse)
            }
            return response
        }
        
        func forecast(city: String) async throws -> Forecast {
            guard let response = forecastResponse else {
                throw URLError(.badServerResponse)
            }
            return response
        }
        
    }
        
    func testRepositoryReturnsDataFromService() async throws {
        
        let mockRemoteDataSource = MockWeatherRemoteDataSource()
        let weather = Weather(city: "Bangalore", temperature: 25.0, description: "Sunny")
        let entry = Forecast.Entry(id: 1, date: Date(), temperature: 23.5, description: "Clear")
        let forecast = Forecast(city: "Bangalore", list: [entry])
        mockRemoteDataSource.weatherResponse = weather
        mockRemoteDataSource.forecastResponse = forecast
        
        let repository = WeatherRepositoryImpl(dataSource: mockRemoteDataSource)
        let result = try await repository.fetchWeatherDetails(for: "Bangalore")
        
        XCTAssertEqual(result.description, "Sunny")
    }
}
