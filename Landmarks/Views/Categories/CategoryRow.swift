//
//  CategoryRom.swift
//  Landmarks
//
//  Created by Eric Liu on 5/28/24.
//

import SwiftUI
import SwiftData

struct CategoryRow: View {
    let categoryName: String
    let landmarks: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    let items = filterLandmarksByCategory(categoryName: categoryName)
                    
                    ForEach(items){ landmark in
                        NavigationLink{
                            LandmarkDetail(landmark: landmark)
                        } label:{
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
    
    private func filterLandmarksByCategory(categoryName: String) -> [Landmark] {
        return landmarks.filter { $0.category.rawValue == categoryName }
    }
}

#Preview {
    return ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        CategoryRow(
            categoryName: PreviewSampleData.landmarks[1].category.rawValue,
            landmarks: PreviewSampleData.landmarks
        )
    }
}
