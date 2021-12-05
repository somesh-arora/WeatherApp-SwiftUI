//
//  WeatherConditionImageView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI

struct WeatherConditionImageView: View {
  
  var imageName: String
  
  
  var body: some View {
    AsyncImage(url: imageUrl()) { image in
      image
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 40, height: 40)
        .foregroundColor(.white)
        .tint(.white)
    } placeholder: {
      ProgressView()
    }
  }
  
  func imageUrl() -> URL? {
    return URL(string: "https://openweathermap.org/img/wn/\(imageName)@2x.png")
  }
}

struct WeatherConditionImageView_Previews: PreviewProvider {
  static var previews: some View {
    WeatherConditionImageView(imageName: "10d")
  }
}
