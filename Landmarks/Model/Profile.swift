//
//  Profile.swift
//  Landmarks
//
//  Created by Eric Liu on 5/29/24.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotification = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "eric")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌺"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
