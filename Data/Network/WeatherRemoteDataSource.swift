//
//  WeatherRemoteDataSource.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

protocol WeatherRemoteDataSource {
    func current(city: String) async throws -> Weather
    func forecast(city: String) async throws -> Forecast
}

final class DefaultWeatherRemoteDataSource: WeatherRemoteDataSource {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func current(city: String) async throws -> Weather {
        let dto: WeatherResponseModel = try await client.request(
            OpenWeatherEndpoint.currentWeather(city: city),
            as: WeatherResponseModel.self
        )
        return WeatherMapper.map(dto)
    }
    
    func forecast(city: String) async throws -> Forecast {
        let dto: ForecastResponseModel = try await client.request(
            OpenWeatherEndpoint.forecast(city: city),
            as: ForecastResponseModel.self
        )
        return ForecastMapper.map(dto)
    }
}


enum WeatherMapper {
    static func map(_ dto: WeatherResponseModel) -> Weather {
        Weather(city: dto.name,
                temperature: dto.main.temp,
                description: dto.weather.first?.description ?? "--")
    }
}

enum ForecastMapper {
    static func map(_ dto: ForecastResponseModel) -> Forecast {
        let entries = dto.list.map { e in
            Forecast.Entry(id: e.dt,
                           date: DateFormatters.longReadable.date(from: e.dtTxt) ?? Date(),
                           temperature: e.main.temp,
                           description: e.weather.first?.description ?? "--")
        }
        return Forecast(city: dto.city.name, list: entries)
    }
}
