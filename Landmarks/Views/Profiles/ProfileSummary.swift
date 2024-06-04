//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Eric Liu on 5/29/24.
//

import SwiftUI

struct ProfileSummary: View {
    var hikes: [Hike]
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notification: \(profile.prefersNotification ? "On": "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal){
                        HStack{
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.50)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: hikes[0])
                }
            }
        }
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        ProfileSummary(hikes: ModelData().hikes, profile: Profile.default)
    }
}
