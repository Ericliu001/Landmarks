//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Eric Liu on 5/20/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    
    var body: some View {
        @Bindable var landmark = landmark
        
        ScrollView {
            MapView(coordinates: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    FavoriteButton(isSet: $landmark.isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                    
                }
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.detail)
                
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    return LandmarkDetail(landmark: Landmark.preview)
}
