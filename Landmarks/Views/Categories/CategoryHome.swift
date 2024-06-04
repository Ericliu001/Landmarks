//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Eric Liu on 5/28/24.
//

import SwiftUI
import SwiftData

struct CategoryHome: View {
    @Query(filter: #Predicate<Landmark> {
        $0.isFeatured == true
    })
    var features: [Landmark]
    var landmarks: [Landmark]
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(landmarks.categories.keys.sorted(),  id: \.self) {
                    key in
                    CategoryRow(categoryName: key, landmarks: landmarks)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button{
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            // TODO:  fix hike
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
            
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    
    ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        CategoryHome(landmarks: PreviewSampleData.landmarks)
    }
}
