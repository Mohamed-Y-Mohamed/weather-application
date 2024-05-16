//
//  Detail.swift
//  CWK2Template
//
//  Created by Mohamed Mohamed on 18/12/2023.
//

import SwiftUI

struct Detail: View {
    let location: Location
    
    var body: some View {
        
        
        VStack {
            Text("Location: \(location.name)")
                .font(.title)
                .padding()
            
            // Add more details or information about the location here
        }
    }
    
    
    
    
    struct Detail_Previews: PreviewProvider {
        static var previews: some View {
            Detail(location: TouristPlacesMapView().selectedLocation ??)
        }
    }
}
