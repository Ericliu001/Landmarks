//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Eric Liu on 5/28/24.
//

import SwiftUI

struct CategoryHome: View {
    @Binding var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(),  id: \.self) {
                    key in
                    CategoryRow(categoryName: key,
                                items: modelData.categories[key]!,
                                landmarks:  $modelData.landmarks)
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
            .sheet(isPresented: $showingProfile) {
                ProfileHost(profile: modelData.profile,
                            hikes: modelData.hikes)
            }
            
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome(modelData: .constant( ModelData()))
}
