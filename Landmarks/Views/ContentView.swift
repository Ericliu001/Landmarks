//
//  ContentView.swift
//  Landmarks
//
//  Created by Eric Liu on 5/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selection: Tab = .featured
    @Environment(\.modelContext) private var modelContext
    @Query var landmarks: [Landmark] = []
    @Query var profiles: [Profile] = []
    
    
    func loadRawDataIfStorageEmpty() {
        if landmarks.isEmpty {
            let modelData = ModelData()
            
            modelData.landmarks.forEach{ landmarkDTO in
                let landmark = Landmark(id: landmarkDTO.id, name: landmarkDTO.name, park: landmarkDTO.park, state: landmarkDTO.state, detail: landmarkDTO.description, isFeatured: landmarkDTO.isFeatured, category: landmarkDTO.category, imageName: landmarkDTO.imageName, coordinates: landmarkDTO.coordinates)
                
                modelContext.insert(landmark)
            }
        }
        
        if profiles.isEmpty {
            modelContext.insert(Profile.default)
        }
    }
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome(landmarks: landmarks)
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList(landmarks: landmarks)
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
                .tag(Tab.list)
        }.onAppear(perform: {
            loadRawDataIfStorageEmpty()
        })
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        ContentView()
    }
}

