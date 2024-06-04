//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Eric Liu on 5/17/24.
//

import SwiftUI
import SwiftData

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()

    

 
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelData: $modelData)
        }
        .modelContainer(for: [Landmark.self])
    }
    
}
