//
//  URLSessionProtocol.swift
//  WeatherForecastTests
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
