//
//  ContentView.swift
//  Landmarks
//
//  Created by Eric Liu on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                .foregroundColor(.black)
                
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                        
                }
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text(verbatim: "Descriptive text goes here.")
                
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}

