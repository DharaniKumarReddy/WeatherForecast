//
//  DependencyContainer.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

final class DependencyContainer {
    
    @MainActor func makeWeatherViewModel() -> WeatherViewModel {
        WeatherViewModel(weatherUseCase: makeWeatherUseCase())
    }
    
    private func makeWeatherUseCase() -> WeatherUseCase {
        WeatherUseCaseImpl(repository: makeWeatherRepository())
    }
    
    private func makeWeatherRepository() -> WeatherRepository {
        WeatherRepositoryImpl(dataSource: makeWeatherRemoteDataSource())
    }
    
    private func makeWeatherRemoteDataSource() -> WeatherRemoteDataSource {
        DefaultWeatherRemoteDataSource(client: makeAPIClient())
    }
    
    private func makeAPIClient() -> APIClient {
        APIClient(session: URLSession.shared, config: makeAPIConfig())
    }
    
    private func makeAPIConfig() -> APIConfig {
        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURL
        
        let apiKey = APIKeys.openWeatherAPIKey
        
        return APIConfig(baseURL: components.url!, apiKey: apiKey)
    }
    
    private var baseURL: String {
        Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
    }
}
