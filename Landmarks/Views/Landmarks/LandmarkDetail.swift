//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Eric Liu on 5/20/24.
//

import SwiftUI

struct LandmarkDetail: View {
    let index: Int
    
    /*
     In your LandmarkDetail view, you're using @State to store a local copy of the landmarks array, which means any changes made to the landmarks array within this view won't be reflected outside of it. To ensure changes are propagated correctly, you should pass the array from a parent view using @Binding instead of @State.
     */
    @Binding var landmarks: [LandmarkDTO]
    
    
    var body: some View {
        let landmark = landmarks[index]
        
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
                    
                    FavoriteButton(isSet: $landmarks[index].isFavorite)
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
    var landmarks = ModelData().landmarks
    return LandmarkDetail(index: 0, landmarks: .constant( landmarks)) // Use the .constant modifier to create a constant binding for the landmarks array.
}
