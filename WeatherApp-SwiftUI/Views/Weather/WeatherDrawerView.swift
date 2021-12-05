//
//  WeatherDrawerView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI

struct WeatherDrawerView: View {
  
  var weather: ResponseBody
  
  var body: some View {
    VStack {
      Spacer()
      contentView
    }
  }
  
  private var contentView: some View {
    VStack(alignment: .center, spacing: 20) {
      currentWeatherTextView
      weatherView
    }
    .frame(maxWidth: .infinity, alignment: .center)
    .padding()
    .padding(.bottom, 20)
    .foregroundColor(Color(hue: 0.603, saturation: 0.732, brightness: 0.283))
    .background(.white)
    .cornerRadius(20, corners: [.topLeft, .topRight])
  }
  
  private var currentWeatherTextView: some View {
    Text("Current Weather")
      .bold()
  }
  
  private var weatherView: some View {
    HStack {
      column1View
      Spacer()
      column2View
    }
  }
  
  private var column1View: some View{
    VStack(alignment: .leading, spacing: 20) {
      minTempView
      windSpeedView
      sunriseView
    }
  }
  
  private var column2View: some View{
    VStack(alignment: .leading, spacing: 20) {
      maxTempView
      humidityView
      sunsetView
    }
  }
  
  private func timestampToDate(value: Double) -> String {
    let date = Date(timeIntervalSince1970: value)
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: date)
  }
  
  private var minTempView: some View {
    WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.temp_min.roundDouble()) + Constants.degreeIcon)
  }
  
  private var maxTempView: some View {
    WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.temp_max.roundDouble()) + Constants.degreeIcon)
  }
  
  private var windSpeedView: some View {
    WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble()) + "m/s")
  }
  
  private var humidityView: some View {
    WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble()) + "%")
  }
  
  private var sunriseView: some View {
    WeatherRow(logo: "sunrise", name: "Sunrise", value: timestampToDate(value: weather.sys.sunrise))
  }
  
  private var sunsetView: some View {
    WeatherRow(logo: "sunset", name: "Sunset", value: timestampToDate(value: weather.sys.sunset))
  }
}

struct CurrentWeatherDrawerView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherDrawerView(weather: previewWeather)
  }
}
