//
//  HourWeatherView.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import SwiftUI

struct HourWeatherView: View {
    var current: Current
    
    var body: some View {
        let formattedDate = DateFormatterUtils.formattedDateWithDay(from: TimeInterval(current.dt))
        VStack(alignment: .leading, spacing: 5) {

            Text(formattedDate)
                .font(.title3)
                .padding(.horizontal)
                .multilineTextAlignment(.center)
            
            if current.weather.first != nil {
                AsyncImage (url:URL( string: "https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png"))
                    .scaleEffect(0.5)
                    .offset(x:40)
                    .frame(width: 25,height: 25,alignment: .center)
                    
                
            }
            Text("\(String(format: "%.2f", current.temp))ºC")
                .padding()
                .font(.title3)
                .multilineTextAlignment(.center)

            Text("\(current.weather[0].weatherDescription.rawValue)")
                .font(.title3)
                .multilineTextAlignment(.center)
        }.cornerRadius(30)
        
        .multilineTextAlignment(.center)
        .padding(.all)
        .background(Color("hourcolor"))
        .cornerRadius(5)
        
    }
    
}





