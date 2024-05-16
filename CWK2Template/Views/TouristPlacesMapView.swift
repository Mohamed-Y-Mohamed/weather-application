//
//  TouristPlacesMapView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//

import Foundation
import SwiftUI
import CoreLocation
import MapKit

struct TouristPlacesMapView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    @State var locations: [Location] = []
    @State var selectedLocation :Location? = nil
    @State var isShowingPopup = false
    
    
    @State var  mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5216871, longitude: 0.11), latitudinalMeters: 600, longitudinalMeters: 600)
    
    
    var body: some View {
        
        VStack {
            VStack(spacing: 5) {
                if weatherMapViewModel.coordinates != nil {
                    Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: locations){
                        location in
                        MapMarker(coordinate: location.coordinates)
                    }
                    .ignoresSafeArea()
                    Text(" Toursit Attraction in \(weatherMapViewModel.city)")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                    
                    
                }
                
                List {
                    if !locations.isEmpty {
                        ForEach(locations) { location in
                            HStack {
                                if let imageName = location.imageNames.first {
                                    Image(imageName)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                }
                                VStack(alignment: .leading) {
                                    Text(location.name)
                                        .font(.title2)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .onTapGesture {
                                selectedLocation = location
                                isShowingPopup = true
                                
                            }
                            
                        }
                    }
                    else {
                        Text("No attraction data exists for this city")
                            .multilineTextAlignment(.center)
                            .font(.title2)
                    }
                }
                .sheet(isPresented: $isShowingPopup) {
                    if let selectedLocation = selectedLocation {
                        detailView(location: selectedLocation, isShowingPopup: $isShowingPopup)
                        
                        
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
        
        .onAppear {
            if let LocateData = weatherMapViewModel.loadLocationsFromJSONFile(cityName: weatherMapViewModel.city) {
                self.locations = LocateData
                
            }
            let pins = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            mapRegion = weatherMapViewModel.region
            
        }
        
    }
}


struct TouristPlacesMapView_Previews: PreviewProvider {
    static var previews: some View {
        TouristPlacesMapView()
            .environmentObject(WeatherMapViewModel())
    }
}

