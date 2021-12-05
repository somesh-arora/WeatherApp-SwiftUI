//
//  WeatherManager.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import Foundation
import CoreLocation

class WeatherManager {
  
  func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=5a8d85a3e0d4767198fabcc21a22c252&units=metric") else {
      fatalError("Invalid URL")
    }
    
    let urlRequest = URLRequest(url: url)
    
    let (data, response) = try await URLSession.shared.data(for: urlRequest)
    
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
      fatalError("Error while fetching weather data")
    }
    
    let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
    
    return decodedData
  }
}

struct ResponseBody: Decodable {
  var coord: CoordinatesResponse
  var weather: [WeatherResponse]
  var main: MainResponse
  var wind: WindResponse
  var clouds: CloudResponse
  var sys: SystemResponse
  var name: String
  var base: String
  var dt: Double
  var timezone: Double
  var id: Double
  var cod: Double
}

struct CoordinatesResponse: Decodable {
  var lon: Double
  var lat: Double
}

struct WeatherResponse: Decodable {
  var id: Double
  var main: String
  var description: String
  var icon: String
}

struct MainResponse: Decodable {
  var temp: Double
  var feels_like: Double
  var temp_min: Double
  var temp_max: Double
  var pressure: Double
  var humidity: Double
}

struct WindResponse: Decodable {
  var speed: Double
  var deg: Double
}

struct CloudResponse: Decodable {
  var all: Int
}

struct SystemResponse: Decodable {
  var type: Int
  var id: Double
  var country: String
  var sunrise: Double
  var sunset: Double
}
