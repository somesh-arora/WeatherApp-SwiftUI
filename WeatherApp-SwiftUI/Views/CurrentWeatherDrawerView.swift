//
//  CurrentWeatherDrawerView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI

struct CurrentWeatherDrawerView: View {
  
  var weather: ResponseBody
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("Weather now")
        .bold()
        .padding(.bottom)
      
      HStack {
        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble()) + "\u{00B0}")
        Spacer()
        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble()) + "\u{00B0}")
      }
      
      HStack {
        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble()) + "m/s")
        Spacer()
        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble()) + "%")
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
    .padding(.bottom, 20)
    .foregroundColor(Color(hue: 0.603, saturation: 0.732, brightness: 0.283))
    .background(.white)
    .cornerRadius(20, corners: [.topLeft, .topRight])
  }
}

struct CurrentWeatherDrawerView_Previews: PreviewProvider {
  static var previews: some View {
    CurrentWeatherDrawerView(weather: previewWeather)
  }
}
