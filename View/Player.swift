//
//  Player.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/27.
//

import SwiftUI

struct Player: View {
    @AppStorage("currentPage") var currentPage = 1

    var body: some View {
        ZStack {
            
            LoopingPlayer()
//                .overlay(Color.black.opacity(0.3))
//                .blur(radius: 1)
                .edgesIgnoringSafeArea(.all)

//            VStack {
//
//                HStack{
//
//                    Button(action: {
//                        withAnimation(.easeInOut) {
//                            currentPage -= 1
//
//                        }
//                    }, label: {
//                        Image(systemName:"chevron.left")
//                            .foregroundColor(.white)
//                            .padding(.vertical, 10)
//                            .padding(.horizontal)
//                            .background(Color.gray.opacity(0.4))
//                            .cornerRadius(15)
//
//                    })
//                    Spacer()
//                }
//                .padding(.horizontal)
//                .padding(.top, 20)
//
//                Spacer()
//                Image(systemName: "chart.bar.xaxis")
//                .resizable()
//                .frame(width: 70, height: 70)
//                    .aspectRatio(contentMode: .fit)
//                    .foregroundColor(.black)
//                    .padding(.bottom, 30)
//                Text("Connect to the world")
//                    .font(.largeTitle)
//                    .foregroundColor(.black)
//                Text("Get connected to the world's largest community of developers. Share your projects, your ideas and take advantage of the knowledge of more than 1,000 experts.")
//                    // chỉnh lề chữ
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(.black)
//                    // giới hạn khoảng
//                    .frame(maxWidth: 320)
//                    .padding(.top, 20)
//                    .padding(.bottom, 50)
//                Spacer()
//                Rectangle()
//                    .frame(height: 1)
//                    .foregroundColor(.white)
//                    .padding(.bottom, 20)
//            }
        }
    }
}

