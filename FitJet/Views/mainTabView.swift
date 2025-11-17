//
//  mainTabView.swift
//  FitJet
//
//  Created by Pavithran P K on 15/11/25.
//

import SwiftUI

struct mainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            HomeView()   // create this dummy view for now
                .tabItem {
                    Image(systemName: "figure.strengthtraining.traditional")
                    Text("Workout")
                }
            
            HomeView()   // create this dummy view for now
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    mainTabView()
}
