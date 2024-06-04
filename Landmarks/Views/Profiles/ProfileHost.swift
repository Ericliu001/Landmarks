//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Eric Liu on 5/29/24.
//

import SwiftUI
import SwiftData

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Query var profiles: [Profile]
    @State private var draftProfile = Profile.default
    let hikes: [Hike] = ModelData().hikes
    
    var body: some View {
        var profile: Profile = profiles.isEmpty ? Profile.default : profiles[0]
        
        VStack(alignment: .leading, spacing: 20){
            
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel){
                        draftProfile = profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(
                    hikes: hikes,
                    profile: profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear{
                        draftProfile = profile
                    }
                    .onDisappear{
                        profile = draftProfile
                        
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        ProfileHost()
    }
}
