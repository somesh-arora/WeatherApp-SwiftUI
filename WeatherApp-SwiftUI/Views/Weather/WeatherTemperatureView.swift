//
//  WeatherTemperatureView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI

struct WeatherTemperatureView: View {
  
  var weather: ResponseBody
  
  var body: some View {
    HStack {
      conditionView
      Spacer()
      temperatureText
    }
  }
  
  private var conditionView: some View {
    VStack(spacing: 8) {
      WeatherConditionImageView(imageName: weather.weather.first?.icon ?? "")
      conditionText
    }
  }
  
  private var conditionText: some View {
    Text(weather.weather.first?.main ?? "")
      .font(.title3)
      .fontWeight(.bold)
  }
  
  private var temperatureText: some View {
    Text(weather.main.feels_like.roundDouble() + Constants.degreeIcon)
      .font(.system(size: 80))
      .fontWeight(.bold)
      .padding()
  }
}

struct WeatherTemperatureView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherTemperatureView(weather: previewWeather)
  }
}
