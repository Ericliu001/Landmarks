//
//  CircleImage.swift
//  Landmarks
//
//  Created by Eric Liu on 5/17/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: /*@START_MENU_TOKEN@*/7/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircleImage()
}
