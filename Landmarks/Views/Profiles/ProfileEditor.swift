//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Eric Liu on 5/30/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotification, label: {
                Text("Enable Notification")
            })
            
            Picker("Season Photo", selection: $profile.seasonalPhoto){
                ForEach(Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goad Date")
            }
            
        }
    }
}

#Preview {
    ModelContainerPreview(PreviewSampleData.inMemoryContainer){
        ProfileEditor(profile: .constant(.default))
    }
}
