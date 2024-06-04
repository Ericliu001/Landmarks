//
//  CategoryRom.swift
//  Landmarks
//
//  Created by Eric Liu on 5/28/24.
//

import SwiftUI

struct CategoryRow: View {
    let categoryName: String
    var items: [LandmarkDTO]
    @Binding var landmarks: [LandmarkDTO]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items){ landmark in
                        NavigationLink{
                            if let index = landmarks.firstIndex(where: {$0.id == landmark.id}){
                                LandmarkDetail( index: index, landmarks: $landmarks)
                            }
                        } label:{
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return
    CategoryRow(
        categoryName: landmarks[1].category.rawValue,
        items:  Array(landmarks.prefix(4)),
        landmarks: .constant(landmarks)
    )
}
