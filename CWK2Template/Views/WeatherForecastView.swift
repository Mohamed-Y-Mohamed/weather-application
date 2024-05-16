import SwiftUI
struct WeatherForecastView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                  
                
                VStack(alignment: .leading, spacing: 16) {
                    if let hourlyData = weatherMapViewModel.weatherDataModel?.hourly {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(hourlyData) { hour in
                                    HourWeatherView(current: hour)
                                }
                            }
                            .padding(.horizontal, 16)
                           
                            
                        }
                        .frame(height: 180)
                        .background (
                            Image("background2")
                                .resizable()
                                .scaledToFill()
                                .offset(y: -20)
                                .opacity(0.7)
                        )
                        
                     
                    }
                    
                    Divider()
                    
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    HStack {
                        
                        
                        List {
                            ForEach(weatherMapViewModel.weatherDataModel?.daily ?? []) { day in
                                DailyWeatherView(day: day)
                            }
                            
                        }
                        
                        .listStyle(GroupedListStyle())
                        .frame(height: 500)
                        .padding(.horizontal, -20) // Adjust padding
                      
                        
                        
                        
                    }
                   
                    
                    
                }
                    .padding(.horizontal)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image(systemName: "sun.min.fill")
                                VStack {
                                    Text("Weather Forecast for \(weatherMapViewModel.city)")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                }
                            }
                        }
                    }
                }
            }
        }
    
}

struct WeatherForcastView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherForecastView()
            .environmentObject(WeatherMapViewModel())
    }
}
