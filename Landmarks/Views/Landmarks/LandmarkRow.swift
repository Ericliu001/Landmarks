//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Eric Liu on 5/20/24.
//

import SwiftUI

struct LandmarkRow: View {
    let landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("Turtle Rock") {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        Group{
            LandmarkRow(landmark: Landmark.preview)
            LandmarkRow(landmark: Landmark.preview2)
        }
    }
    
}

