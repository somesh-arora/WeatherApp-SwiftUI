//
//  ContentView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var locationManager = LocationManager()
  
  var weatherManager = WeatherManager()
  
  @State private var weather: ResponseBody?
  
    var body: some View {
      VStack {
        if let location = locationManager.location {
          if let weather = weather {
            WeatherContainerView(weather: weather)
          } else {
            LoadingView()
              .task {
                do {
                  weather = try await
                  weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                } catch {
                  print("Error getting weather data: \(error)")
                }
              }
          }
        } else {
          if locationManager.isLoading {
            LoadingView()
          } else {
            WelcomeView()
              .environmentObject(locationManager)
          }
        }
      }
      .background(Color(hue: 0.603, saturation: 0.732, brightness: 0.283))
      .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
