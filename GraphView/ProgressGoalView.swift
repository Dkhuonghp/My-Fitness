//
//  ProgressGoalView.swift
//  MapView
//
//  Created by NGUYEN DUY KHUONG on 2021/07/06.
//

import SwiftUI

struct ProgressGoalView: View {
    @EnvironmentObject var manager: StepCountManager
    var body: some View {
        ZStack {
            Circle()

                .stroke(RadialGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.3), Color.white.opacity(0.3)]),
                            center: .center,
                            startRadius: 80,
                            endRadius: 200),
                        lineWidth: 5)
                .frame(width: 160, height: 160)

            ZStack{
                
                RoundedRectangle(cornerRadius: 300)
                    .fill(Color.white)
                    .frame(width: 150, height: 150)
                    .blur(radius: 4)
//                    .offset(x: -8, y: -8)


                
                RoundedRectangle(cornerRadius: 300, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 150, height: 150)

//                    .padding(2)
                    .blur(radius: 2)
            }
            .clipShape(RoundedRectangle(cornerRadius: 300, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), radius: 20, x: -20, y: -20)
            
            Circle()
                .trim(from: 0, to: manager.goalPercentage)
                .stroke(LinearGradient(
                            gradient: Gradient(
                                colors: [ColorConstants.bottomColor2, Color.green]),
                            startPoint: .top,
                            endPoint: .trailing),
                        style: StrokeStyle(
                            lineWidth: 5,
                            lineCap: .round))
                .frame(width: 160, height: 160)
                .rotationEffect(.degrees(-90))
//                .shadow(color: ColorConstants.bottomColor2, radius: 30)
            
            VStack(spacing: 12) {
                Text("Goal: \(getFormeattedInt(number: manager.stepData.goal))")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                Text("\(getFormeattedInt(number: manager.stepData.count))")
                    .font(.system(size: 36))
                    .foregroundColor(.black)
            }
            .foregroundColor(.white)
                
        }
        
    }
    
    func getFormeattedInt(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = false
        return formatter.string(from: NSNumber(value: number))!
    }
}

