//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Eric Liu on 5/20/24.
//

import SwiftUI

struct LandmarkList: View {
    @State var landmarks: [Landmark]
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
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(
                            landmark: landmark)
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
    LandmarkList(landmarks: ModelData().landmarks)
}
