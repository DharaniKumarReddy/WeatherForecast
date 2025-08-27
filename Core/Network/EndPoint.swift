//
//  EndPoint.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

enum HTTPMethod: String { case GET, POST, PUT, DELETE }

protocol EndPoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
}
