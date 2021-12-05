//
//  WelcomeView.swift
//  WeatherApp-SwiftUI
//
//  Created by Somesh Arora on 12/4/21.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
  @EnvironmentObject var locationManager: LocationManager
    var body: some View {
      VStack {
        VStack(spacing: 20) {
          Text("Welcome to the Weather App")
            .font(.title)
            .bold()
          
          Text("Please grant location access to see the weather in your area")
            .padding()
        }
        .multilineTextAlignment(.center)
        .padding()
        
        LocationButton(.shareCurrentLocation) {
          locationManager.requestLocation()
        }
        .symbolVariant(.fill)
        .foregroundColor(.white)
        .cornerRadius(20)
        
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
