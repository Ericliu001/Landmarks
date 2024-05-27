//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Eric Liu on 5/27/24.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
        
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
