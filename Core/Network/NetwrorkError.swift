//
//  NetwrorkError.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case statusCode(Int, Data?)
    case emptyData
    case decoding(Error)
    case transport(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Invalid response"
        case .statusCode(let code, _): return "HTTP \(code) error"
        case .emptyData: return "Empty response"
        case .decoding(let e): return "Decoding failed: \(e.localizedDescription)"
        case .transport(let e): return "Network error: \(e.localizedDescription)"
        }
    }
}
