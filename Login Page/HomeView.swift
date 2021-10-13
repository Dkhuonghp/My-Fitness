//
//  HomeView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/15.
//

import SwiftUI

struct HomeView: View {
    @State var isActive: Bool = false
    @State var isLiked: Bool = false

    var body: some View {
        
        TabView {
            HomeWorkoutView()
                .tabItem {
                    Image(systemName: "bolt.fill")
                    Text("Home Workout")
                }
            
            HomeScreen(isLiked: $isLiked)
                .tabItem {
                    Image(systemName: "safari.fill")
                    Text("Discover")
                }
            ScreenUI()
//            LevelTest()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Daily")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .font(.headline)
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//            .preferredColorScheme(.light)
//
//    }
//}
