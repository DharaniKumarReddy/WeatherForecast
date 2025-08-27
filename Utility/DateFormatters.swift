//
//  DateFormatters.swift
//  WeatherForecast
//
//  Created by Dharani Reddy on 25/08/25.
//

import Foundation

enum DateFormatters {
    
    /// Example: 2025-08-25 12:00:00
    static let longReadable: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    static let dayTimePeriod: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, ha"
        return formatter
    }()
}
