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
        $0.isFavorite == true
    })
    var features: [Landmark]
    var landmarks: [Landmark]
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            List {
                landmarks[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(landmarks.categories.keys.sorted(),  id: \.self) {
                    key in
                    CategoryRow(categoryName: key,
                                items: landmarks)
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
            //            .sheet(isPresented: $showingProfile) {
            //                ProfileHost(profile: Profile.default, // TODO: get real data here.
            //                            hikes: modelData.hikes)
            //            }
            //
        } detail: {
            Text("Select a Landmark")
        }
    }
}

//#Preview {
//    CategoryHome(modelData: .constant( ModelData()))
//}
