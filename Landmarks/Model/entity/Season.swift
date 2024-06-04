//
//  Season.swift
//  Landmarks
//
//  Created by Eric Liu on 6/4/24.
//

import Foundation


enum Season: String, CaseIterable, Identifiable {
    case spring = "🌺"
    case summer = "🌞"
    case autumn = "🍂"
    case winter = "☃️"
    
    var id: String { rawValue }
}
