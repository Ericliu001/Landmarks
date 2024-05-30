//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Eric Liu on 5/29/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @State var profile: Profile
    @State private var draftProfile = Profile.default
    var hikes: [Hike]
    
    var body: some View {
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
    let modelData = ModelData()
    return ProfileHost(
                profile: modelData.profile,
                hikes: modelData.hikes)
}
