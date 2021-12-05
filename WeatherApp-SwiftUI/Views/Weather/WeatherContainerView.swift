//
//  WeatherContainerView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI

struct WeatherContainerView: View {
  
  var weather: ResponseBody
  
  var body: some View {
    ZStack(alignment: .leading) {
      contentView
      WeatherDrawerView(weather: weather)
    }
    .edgesIgnoringSafeArea(.bottom)
    .background(Color(hue: 0.603, saturation: 0.732, brightness: 0.283))
    .preferredColorScheme(.dark)
  }
  
  private var contentView: some View {
    VStack {
      VStack(alignment: .leading, spacing: 5) {
        cityNameView
        formattedDate
        Spacer()
        temperatureAndImageView
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var temperatureAndImageView: some View {
    VStack {
      WeatherTemperatureView(weather: weather)
      Spacer()
        .frame(height: 30)
      cityImageView
      Spacer()
    }
    .frame(maxWidth: .infinity)
  }
  
  private var cityNameView: some View {
    Text(weather.name)
      .bold()
      .font(.largeTitle)
  }
  
  private var cityImageView: some View {
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
  }
  
  private var formattedDate: some View {
    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
      .fontWeight(.light)
  }
}

struct WeatherView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherContainerView(weather: previewWeather)
  }
}
