//
//  APIClient.swift
//  WeatherForecastTests
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

final class APIClient {
    
    private let session: URLSessionProtocol
    private let config: APIConfig
    private let decoder: JSONDecoder
    
    init(session: URLSessionProtocol,
         config: APIConfig,
         decoder: JSONDecoder = APIClient.makeDecoder()) {
        self.session = session
        self.config = config
        self.decoder = decoder
    }
    
    func request<T: Decodable>(_ endPoint: EndPoint, as: T.Type) async throws -> T {
        
        var components = URLComponents(url: config.baseURL, resolvingAgainstBaseURL: false)
        components?.path = endPoint.path
        
        var items = endPoint.queryItems
        items.append(URLQueryItem(name: "appid", value: config.apiKey))
        items.append(URLQueryItem(name: "units", value: config.units))
        components?.queryItems = items
        
        guard let url = components?.url else { throw NetworkError.invalidURL}
        
        do {
            let (data, response) = try await session.data(from: url)
            guard let http = response as? HTTPURLResponse else { throw NetworkError.invalidResponse }
            guard (200..<300).contains(http.statusCode) else { throw NetworkError.statusCode(http.statusCode, data) }
            guard !data.isEmpty else { throw NetworkError.emptyData }
            do {
                return try decoder.decode(T.self, from: data)
            } catch {
                throw NetworkError.decoding(error)
            }
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.transport(error)
        }
    }
    
    static func makeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
}
