//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Eric Liu on 5/20/24.
//

import SwiftUI

struct LandmarkDetail: View {
   @State var landmark: Landmark
    
    var body: some View {
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
                
                Text(landmark.description)
                
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return LandmarkDetail(
        landmark: landmarks[0])
}
