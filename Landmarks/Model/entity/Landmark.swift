//
//  Landmark.swift
//  Landmarks
//
//  Created by Eric Liu on 6/4/24.
//

import Foundation
import SwiftData
import SwiftUI
import CoreLocation

@Model
final class Landmark {
    @Attribute(.unique) let id: Int
    let name: String
    let park: String
    let state: String
    let detail: String
    let isFeatured: Bool
    let category: Category
    let imageName: String
    let coordinates: Coordinates
    var isFavorite: Bool
    
    init(id: Int, name: String, park: String, state: String, detail: String, isFeatured: Bool, category: Category, imageName: String, coordinates: Coordinates, isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.park = park
        self.state = state
        self.detail = detail
        self.isFeatured = isFeatured
        self.category = category
        self.imageName = imageName
        self.coordinates = coordinates
        self.isFavorite = isFavorite
    }
}


extension Landmark {
    @Transient
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    @Transient
    var image: Image {
        Image(imageName)
    }
    
    static var preview: Landmark =
        Landmark(id: 0, name: "Cool Park", park: "Yosemite", state: "CA", detail: "This is my favorite park, and I go every Summer.", isFeatured: true, category: .lakes, imageName: "turtlerock", coordinates: Coordinates(latitude: 0, longitude: 0))
    
}

extension [Landmark] {
    var categories: [String: [Landmark]] {
        Dictionary(grouping: self, by: {$0.category.rawValue})
    }
}
