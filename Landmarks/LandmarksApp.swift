//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Eric Liu on 5/17/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
