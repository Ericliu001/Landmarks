//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Eric Liu on 5/20/24.
//

import SwiftUI
import SwiftData

struct LandmarkList: View {
    var landmarks: [Landmark]
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(Array(filteredLandmarks.enumerated()), id: \.element.id) { index, landmark in
                    NavigationLink {
                        // Make sure the parent view uses @State to hold the landmarks array and passes a binding to LandmarkDetail: $landmarks
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
                
                .navigationTitle("Landmarks")
            }
        } detail: {
            Text("Select a Landmark")
        }
        .animation(.default, value: filteredLandmarks)
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        LandmarkList(landmarks: PreviewSampleData.landmarks)
    }
}
