//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation
import SwiftUI

@MainActor
final class WeatherViewModel: ObservableObject {
    @Published var temperature = ""
    @Published var description = ""
    @Published var list: [Forecast.Entry] = []
    
    @Published var isLoading = false
    @Published var selectedMode: WeatherMode = .current
    @Published var errorMessage: String?
    
    private let useCase: WeatherUseCase
    
    init(weatherUseCase: WeatherUseCase) {
        self.useCase = weatherUseCase
    }
    
    func fetchReport(for city: String) async {
        errorMessage = nil
        guard !city.isEmpty else {
            errorMessage = "Please enter a city."
            return
        }
        isLoading = true
        defer { isLoading = false }
        
        switch selectedMode {
        case .current:
            await fetchWeatherReport(for: city)
        case .forecast:
            await fetchForecastReport(for: city)
        }
    }
    
    private func fetchWeatherReport(for city: String) async {
        do {
            let weather = try await useCase.getWeatherData(city: city)
            temperature = String(describing: weather.temperature) + "°C"
            description = weather.description
        } catch {
            errorMessage = "Failed to load weather: \(error.localizedDescription)"
        }
    }
    
    private func fetchForecastReport(for city: String) async {
        do {
            let forecast = try await useCase.getForecastData(city: city)
            list = forecast.list
        } catch {
            errorMessage = "Failed to load forecast: \(error.localizedDescription)"
        }
    }
}
