//
//  Landmark.swift
//  Landmarks
//
//  Created by Eric Liu on 5/20/24.
//

import Foundation
import SwiftUI
import CoreLocation


struct LandmarkDTO: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category

    
    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }

}
