//
//  PreviewSampleData.swift
//  Landmarks
//
//  Created by Eric Liu on 6/4/24.
//

import Foundation
import SwiftUI
import SwiftData

actor PreviewSampleData {
    @MainActor
    static var container: ModelContainer = {
        return try! inMemoryContainer()
    }()
    
    static var inMemoryContainer: () throws -> ModelContainer = {
        let schema = Schema([Landmark.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: schema, configurations: [configuration])
        let sampleData: [any PersistentModel] = [
            Landmark.preview
        ]
        Task { @MainActor in
            sampleData.forEach {
                container.mainContext.insert($0)
            }
        }
        return container
    }
}
