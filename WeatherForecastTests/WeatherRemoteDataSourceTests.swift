//
//  WeatherRemoteDataSourceTests.swift
//  WeatherForecastTests
//
//  Created by Dharani Reddy on 26/08/25.
//

import XCTest
@testable import WeatherForecast


final class WeatherRemoteDataSourceTests: XCTestCase {

    func testFetchWeatherDetails() async throws {
        let mockSession = MockURLSession()
        mockSession.mockData = sampleWeatherJSON
        
        let config = APIConfig(baseURL: URL(string: "https://api.example.com")!, apiKey: "key")
        let client = APIClient(session: mockSession, config: config)
        let dataSource = DefaultWeatherRemoteDataSource(client: client)
        let result: Weather = try await dataSource.current(city: "Bangalore")
        
        XCTAssertEqual(result.city, "Bangalore")
        XCTAssertEqual(result.temperature, 291.53)
        XCTAssertEqual(result.description, "clear sky")
        
    }
    
    func testFetchForecastDetails() async throws {
        let mockSession = MockURLSession()
        mockSession.mockData = sampleForecastJSON
        
        let config = APIConfig(baseURL: URL(string: "https://api.example.com")!, apiKey: "key")
        let client = APIClient(session: mockSession, config: config)
        let dataSource = DefaultWeatherRemoteDataSource(client: client)
        let result: Forecast = try await dataSource.forecast(city: "London")
        
        XCTAssertEqual(result.city, "London")
        XCTAssertEqual(result.list.count, 8)

    }

}
