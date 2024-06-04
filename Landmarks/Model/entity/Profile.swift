//
//  Profile.swift
//  Landmarks
//
//  Created by Eric Liu on 5/29/24.
//

import Foundation
import SwiftData


@Model
final class Profile {
    var username: String
    var prefersNotification: Bool
    var seasonalPhoto : String
    var goalDate : Date
    
    init(username: String, prefersNotification: Bool = true, seasonalPhoto: String = Season.winter.rawValue, goalDate: Date = Date()) {
        self.username = username
        self.prefersNotification = prefersNotification
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = goalDate
    }

}

extension Profile {
    static let `default` = Profile(username: "eric")
}
