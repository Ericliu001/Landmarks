//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Eric Liu on 5/28/24.
//

import SwiftUI

struct CategoryItem: View {
    let landmark: LandmarkDTO
    
    var body: some View {
        VStack{
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
