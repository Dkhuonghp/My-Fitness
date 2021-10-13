//
//  RateView.swift
//  MapView
//
//  Created by NGUYEN DUY KHUONG on 2021/07/06.
//

import SwiftUI

struct RateView: View {
    var body: some View {

        ZStack {
            
            VStack {
                
                ProgressGoalView()
                    .padding(.top, 20)
                                
                InfoDashboardView()
//                    .padding()
                    .padding(.horizontal,40)
                Divider()
//                HStack(spacing: 50){
//                    Image(systemName: "music.note.list")
//                    Spacer()
//                    Image(systemName: "house")
//                }
//                .padding(.horizontal, 80)

                PlayPauseView()
                    .padding()
                    .padding(.bottom, 60)
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        .environmentObject(StepCountManager())

    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        MapLocation()
    }
}
