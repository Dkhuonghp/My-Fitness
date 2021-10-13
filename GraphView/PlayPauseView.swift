//
//  PlayPauseView.swift
//  MapView
//
//  Created by NGUYEN DUY KHUONG on 2021/07/06.
//

import SwiftUI


struct PlayPauseView: View {
    @EnvironmentObject var manager: StepCountManager
    var body: some View {
        ZStack {
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 35)
                    .fill(Color.white)
                    .frame(width: 170, height: 70)
                    .blur(radius: 4)
                    .offset(x: -8, y: -8)


                
                RoundedRectangle(cornerRadius: 35, style: .continuous)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 250, height: 70)

                    .padding(2)
                    .blur(radius: 2)
            }
            .clipShape(RoundedRectangle(cornerRadius: 35, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), radius: 20, x: -20, y: -20)
            
            
            HStack {
                
                Text(manager.start ? "Stop" : "Start")
                    .font(.system(size: 24))
                    .bold()
                    .fixedSize()
                    .frame(width: 60)
                    .padding(.leading, 8)
                    
            }
//            .offset(x: -12)
        }
        .onTapGesture {
            manager.updateData()
        }
    }
}
struct PlayPauseView_Previews: PreviewProvider {
    static var previews: some View {
        PlayPauseView()
    }
}
