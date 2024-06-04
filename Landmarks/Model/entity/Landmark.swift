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
    
    
    static var preview2: Landmark =
        Landmark(id: 0, name: "Twin Lake", park: "Lake Clark National Park and Preserve", state: "Alaska", detail: "Suscipit inceptos est felis purus aenean aliquet adipiscing diam venenatis, augue nibh duis neque aliquam tellus condimentum sagittis vivamus, cras ante etiam sit conubia elit tempus accumsan libero, mattis per erat habitasse cubilia ligula penatibus curae. Sagittis lorem augue arcu blandit libero molestie non ullamcorper, finibus imperdiet iaculis ad quam per luctus neque, ligula curae mauris parturient diam auctor eleifend laoreet ridiculus, hendrerit adipiscing sociosqu pretium nec velit aliquam. Inceptos egestas maecenas imperdiet eget id donec nisl curae congue, massa tortor vivamus ridiculus integer porta ultrices venenatis aliquet, curabitur et posuere blandit magnis dictum auctor lacinia, eleifend dolor in ornare vulputate ipsum morbi felis. Faucibus cursus malesuada orci ultrices diam nisl taciti torquent, tempor eros suspendisse euismod condimentum dis velit mi tristique, a quis etiam dignissim dictum porttitor lobortis ad fermentum, sapien consectetur dui dolor purus elit pharetra. Interdum mattis sapien ac orci vestibulum vulputate laoreet proin hac, maecenas mollis ridiculus morbi praesent cubilia vitae ligula vel, sem semper volutpat curae mauris justo nisl luctus, non eros primis ultrices nascetur erat varius integer.", isFeatured: true, category: .mountains, imageName: "twinlake", coordinates: Coordinates(latitude: -143.122586, longitude: 65.350021))
    
}

extension [Landmark] {
    var categories: [String: [Landmark]] {
        Dictionary(grouping: self, by: {$0.category.rawValue})
    }
}
