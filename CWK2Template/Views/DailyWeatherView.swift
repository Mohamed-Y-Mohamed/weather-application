//
//  DailyWeatherView.swift
//  CWK2Template
//
//  Created by girish lukka on 02/11/2023.
//

import SwiftUI

struct DailyWeatherView: View {
    var day: Daily
    var body: some View {
        
        let formattedDate = DateFormatterUtils.formattedDateWithWeekdayAndDay(from: TimeInterval(day.dt))
        HStack{
            VStack{
                if day.weather.first != nil {
                    AsyncImage (url:URL( string: "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
                        .scaleEffect(0.5)
                        .frame(width: 20,height:35)
                }
            }
            Spacer()
            
            VStack{
                Text(day.weather[0].weatherDescription.rawValue)
                    .font(.body) // Customize the font if needed
                Text(formattedDate)
                    .font(.body) // Customize the font if needed
            }
            Spacer()
            
            VStack{
                Text("\(Int(day.temp.min))ºC/\(Int( day.temp.max))ºC ")
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                
            }
            
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .clipped()
                .opacity(0.1)
        )
    
        
        
    }
    
}

struct DailyWeatherView_Previews: PreviewProvider {
    static var day = WeatherMapViewModel().weatherDataModel!.daily
    static var previews: some View {
        DailyWeatherView(day: day[0])
    }
}
