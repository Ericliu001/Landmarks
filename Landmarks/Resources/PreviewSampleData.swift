/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The preview sample data actor which provides an in-memory model container.
*/

import SwiftData
import SwiftUI

/**
 Preview sample data.
 */
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
    
    static var landmarks = [
        Landmark.preview,
        Landmark.preview,
        Landmark.preview,
        Landmark.preview,
    ]
}
