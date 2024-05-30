//
//  ContentView.swift
//  Landmarks
//
//  Created by Eric Liu on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    @State var modelData: ModelData
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome(modelData: modelData)
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList(landmarks: modelData.landmarks)
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView(modelData: ModelData())
}

