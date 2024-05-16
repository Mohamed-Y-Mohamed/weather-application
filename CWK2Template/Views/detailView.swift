//
//  detailView.swift
//  CWK2Template
//
//  Created by Mohamed Mohamed on 18/12/2023.
//

import SwiftUI

struct detailView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel

    let location: Location
       @Binding var isShowingPopup: Bool

       var body: some View {
           
           VStack {
               Button("Dismiss") {
                   isShowingPopup = false
               }
               .offset(y:-20)
               .offset(x:120)
               
               Image(location.imageNames[0])
                   .resizable()
                   .frame(width: 250, height: 250)
                   .cornerRadius(20)
                   .multilineTextAlignment(.center)
               Text("city: \(location.cityName)")
                   .multilineTextAlignment(.center)
                   .foregroundColor(Color.orange)
                   .font(.title2)
               Text("Location: \(location.name)")
                
                   .font(.title3)
               
               Text("Coordinate: Latitude: \(location.coordinates.latitude), Longitude: \(location.coordinates.longitude)")
                   .font(.headline)
                   .multilineTextAlignment(.center)
               Text(location.description)
                   .font(.headline)
                   .multilineTextAlignment(.center)

               Link("For more detail click here", destination: URL(string: location.link)!)
                        .foregroundColor(.blue)
               .padding()
           }
           .padding()
           .background(Color.white)
           .cornerRadius(10)
           .padding()
       }
    

}
    
    
