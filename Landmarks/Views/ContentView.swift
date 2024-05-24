//
//  ContentView.swift
//  Landmarks
//
//  Created by Eric Liu on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

