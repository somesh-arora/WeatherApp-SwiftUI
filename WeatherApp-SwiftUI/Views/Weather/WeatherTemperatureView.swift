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
        
        VStack(spacing: 20) {
          Image(systemName: "sun.max")
            .font(.system(size: 40))
          
          Text(weather.weather.first?.main ?? "")
        }
        .frame(width: 150, alignment: .leading)
        
        Spacer()
        
        Text(weather.main.feels_like.roundDouble() + "\u{00B0}")
          .font(.system(size: 80))
          .fontWeight(.bold)
          .padding()
      }
    }
}

struct WeatherTemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherTemperatureView(weather: previewWeather)
    }
}
