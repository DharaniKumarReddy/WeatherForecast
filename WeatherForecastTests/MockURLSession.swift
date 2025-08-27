//
//  MockURLSession.swift
//  WeatherForecastTests
//
//  Created by Dharani Reddy on 26/08/25.
//

import Foundation

@testable import WeatherForecast
class MockURLSession: URLSessionProtocol {
    var mockData: Data?
    var mockResponse: URLResponse?
    var mockError: Error?
    
    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = mockError {
            throw error
        }
        return (mockData ?? Data(), mockResponse ?? HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!)
    }
}


let sampleWeatherJSON = """
{
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 291.53,
    "feels_like": 291.67,
    "temp_min": 291.53,
    "temp_max": 291.53,
    "pressure": 1018,
    "humidity": 86,
    "sea_level": 1018,
    "grnd_level": 952
  },
  "visibility": 10000,
  "timezone": 7200,
  "id": 3163858,
  "name": "Bangalore",
  "cod": 200
}
""".data(using: .utf8)!



let sampleForecastJSON = """
{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1756123200,
      "main": {
        "temp": 79.12,
        "feels_like": 79.12,
        "temp_min": 79.12,
        "temp_max": 79.12,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1011,
        "humidity": 34,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 34
      },
      "wind": {
        "speed": 7.14,
        "deg": 171,
        "gust": 8.72
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2025-08-25 12:00:00"
    },
    {
      "dt": 1756134000,
      "main": {
        "temp": 79.66,
        "feels_like": 79.66,
        "temp_min": 79.66,
        "temp_max": 80.74,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1009,
        "humidity": 31,
        "temp_kf": -0.6
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 37
      },
      "wind": {
        "speed": 8.25,
        "deg": 192,
        "gust": 9.19
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2025-08-25 15:00:00"
    },
    {
      "dt": 1756144800,
      "main": {
        "temp": 77.74,
        "feels_like": 76.53,
        "temp_min": 77.05,
        "temp_max": 77.74,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1008,
        "humidity": 28,
        "temp_kf": 0.38
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 29
      },
      "wind": {
        "speed": 8.12,
        "deg": 198,
        "gust": 10.11
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2025-08-25 18:00:00"
    },
    {
      "dt": 1756155600,
      "main": {
        "temp": 67.69,
        "feels_like": 65.62,
        "temp_min": 67.69,
        "temp_max": 67.69,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1007,
        "humidity": 31,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 2
      },
      "wind": {
        "speed": 5.35,
        "deg": 148,
        "gust": 13.6
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2025-08-25 21:00:00"
    },
    {
      "dt": 1756166400,
      "main": {
        "temp": 60.67,
        "feels_like": 58.23,
        "temp_min": 60.67,
        "temp_max": 60.67,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1006,
        "humidity": 38,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 35
      },
      "wind": {
        "speed": 3.58,
        "deg": 145,
        "gust": 13.87
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2025-08-26 00:00:00"
    },
    {
      "dt": 1756177200,
      "main": {
        "temp": 65.39,
        "feels_like": 63.84,
        "temp_min": 65.39,
        "temp_max": 65.39,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1003,
        "humidity": 47,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.02,
        "deg": 118,
        "gust": 10.07
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2025-08-26 03:00:00"
    },
    {
      "dt": 1756533600,
      "main": {
        "temp": 56.86,
        "feels_like": 56.19,
        "temp_min": 56.86,
        "temp_max": 56.86,
        "pressure": 1002,
        "sea_level": 1002,
        "grnd_level": 998,
        "humidity": 84,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 23
      },
      "wind": {
        "speed": 5.28,
        "deg": 235,
        "gust": 12.33
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2025-08-30 06:00:00"
    },
    {
      "dt": 1756544400,
      "main": {
        "temp": 63.91,
        "feels_like": 63.01,
        "temp_min": 63.91,
        "temp_max": 63.91,
        "pressure": 1002,
        "sea_level": 1002,
        "grnd_level": 998,
        "humidity": 64,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 97
      },
      "wind": {
        "speed": 7.52,
        "deg": 228,
        "gust": 12.95
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2025-08-30 09:00:00"
    }
  ],
  "city": {
    "id": 2643743,
    "name": "London",
    "coord": {
      "lat": 51.5085,
      "lon": -0.1257
    },
    "country": "GB",
    "population": 1000000,
    "timezone": 3600,
    "sunrise": 1756098133,
    "sunset": 1756148602
  }
}
""".data(using: .utf8)!
