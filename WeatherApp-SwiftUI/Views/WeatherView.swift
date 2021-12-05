//
//  WeatherView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI

struct WeatherView: View {
  
  var weather: ResponseBody
  
    var body: some View {
      ZStack(alignment: .leading) {
        VStack {
          VStack(alignment: .leading, spacing: 5) {
            Text(weather.name)
              .bold()
              .font(.title)
            
            formattedDate
            
            Spacer()
            
            VStack {
              
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
              
              Spacer()
                .frame(height: 80)
              
              Image("city")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350)
              
//              AsyncImage(url: URL(string: "https://pixabay.com/illustrations/city-urban-buildings-skyscraper-3867295")) { image in
//                image
//                  .resizable()
//                  .aspectRatio(contentMode: .fit)
//                  .frame(width: 350)
//              } placeholder: {
//                ProgressView()
//              }

              Spacer()
              
            }
            .frame(maxWidth: .infinity)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack {
          Spacer()
          
          CurrentWeatherDrawerView(weather: weather)
        }
      }
      .edgesIgnoringSafeArea(.bottom)
      .background(Color(hue: 0.603, saturation: 0.732, brightness: 0.283))
      .preferredColorScheme(.dark)
    }
  
  private var formattedDate: some View {
    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
      .fontWeight(.light)
  }

}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
      WeatherView(weather: previewWeather)
    }
}
