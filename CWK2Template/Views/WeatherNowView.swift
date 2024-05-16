//
//  WeatherNowView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import SwiftUI

struct WeatherNowView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    @State private var isLoading = false
    @State private var temporaryCity = ""
    var body: some View {
        ZStack{
            Image("sky")
                .resizable()
                .opacity(0.5)
                .ignoresSafeArea()
                .offset(y:-1)
            
            VStack {
                HStack{
                    
                    Text("Change Location")
                    
                    TextField("Enter New Location", text: $temporaryCity)
                        .onSubmit {
                            
                            Task {
                                do {
                                    if temporaryCity != "" {
                                        weatherMapViewModel.city = temporaryCity

                                    }else {
                                        weatherMapViewModel.city = "London"
                                        

                                    }
                                    try await weatherMapViewModel.getCoordinatesForCity()
                                    try await weatherMapViewModel.loadData(lat: weatherMapViewModel.coordinates?.latitude ?? 0,lon: weatherMapViewModel.coordinates?.longitude ?? 0)
                                } catch {
                                    print("Error: \(error)")
                                    isLoading = false
                                }
                            }
                        }
                }
                .bold()
                .font(.system(size: 20))
                .padding(10)
                .shadow(color: .blue, radius: 10)
                .cornerRadius(10)
                .fixedSize()
                .font(.custom("Arial", size: 26))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(15)
                VStack (spacing: 20){
                    HStack{
                        Text("Current Location: \(weatherMapViewModel.city)")
                    }
                    .bold()
                    .font(.system(size: 20))
                    .padding(10)
                    .shadow(color: .blue, radius: 10)
                    .cornerRadius(10)
                    .fixedSize()
                    .font(.custom("Arial", size: 26))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(15)
                    let timestamp = TimeInterval(weatherMapViewModel.weatherDataModel?.current.dt ?? 0)
                    let formattedDate = DateFormatterUtils.formattedDateTime(from: timestamp)
                    Text(formattedDate)
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 1)
                }
                
                HStack{
                                  Spacer()
                                  VStack (spacing: 27){
                                          if let weathericon = weatherMapViewModel.weatherDataModel {
                                              AsyncImage (url:URL( string: "https://openweathermap.org/img/wn/\(weathericon.current.weather[0].icon)@2x.png"))
                                                  .frame(width: 2,height:35)
                                                                     
                                          Image("temperature")
                                              .resizable()
                                              .frame(width: 40,height:40)
                                              .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                          Image("humidity")
                                              .resizable()
                                              .frame(width: 40,height:40)
                                              .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                          Image("pressure")
                                              .resizable()
                                              .frame(width: 40,height:40)
                                              .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                          Image("windSpeed")
                                              .resizable()
                                              .frame(width: 40,height:40)
                                              .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                      }else {
                                          Text("")
                                      }
                                  }
                    VStack(spacing: 35){
                        if let weathericon = weatherMapViewModel.weatherDataModel?.current.weather[0] {
                            Text(" \(weathericon.weatherDescription.rawValue)")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.leading)
                        }
                        
                        if let forecast = weatherMapViewModel.weatherDataModel {
                            
                            Text("Temp: \(String(format: "%.2f", forecast.current.temp)) ºC")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.leading)
                            Text("Humidity: \(forecast.current.humidity) %")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.leading)
                            Text("Pressure: \( forecast.current.pressure) hPa")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.leading)
                            Text("WindSpeed: \(String(format: "%.2f", forecast.current.windSpeed)) mph")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.leading)
                        }else {
                            
                            Text("API reach maximum calls per day. \nTry again later")
                                .font(.system(size: 25, weight: .medium))
                                .multilineTextAlignment(.center)
                          
                        }
                    }
                    Spacer()
                    Spacer()
                }
                Spacer()
                
            }
        }
    }
}

struct WeatherNowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherNowView()
            .environmentObject(WeatherMapViewModel())
    }
}
