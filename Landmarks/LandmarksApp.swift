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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Landmark.self, Profile.self])
    }
    
}
