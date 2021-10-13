//
//  Cuttom.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/24.
//

import SwiftUI

struct Cuttom: View {
    
    var colors: [Color] = [.red,.blue,.pink,.purple]
    @State var offset: CGFloat = 0
    @State var ringring = false
    @State var isLiked = false

    
    var body: some View {
        
        
        VStack{
            
            ZStack {


//                    HStack{
//
//                        VStack{
//
//                            Text("PLAN")
//                                .font(.system(size: 26))
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
//
//                            HStack(spacing: 15){
//                                ForEach(colors.indices, id: \.self){index in
//                                    Rectangle()
//                                        .fill(Color.black)
//                                        .frame(width: 5, height: 5)
//                                }
//                            }
//                            .offset(y: -17)
//                        }
//
//                        Spacer()
//
//                    }
//                    .padding(.horizontal)
            }

            ScrollView(.init()){
                
                TabView{
                
                    BeginnerView(isLiked: $isLiked)
                    
                    CalenderView()

                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                .overlay(
//
//                    HStack(spacing: 15){
//
//                        ForEach(colors.indices,id: \.self){index in
//
//                            Capsule()
//                                .fill(Color.black)
//                                .frame(width: getIndex() == index ? 20 : 7, height: 7)
//                        }
//                    }
////                     smooth sliding effect
//                    .overlay(
//
//                        Capsule()
//                            .fill(Color.black)
//                            .frame(width:20, height: 7)
//                            .offset(x: getOffset())
//
//                        ,alignment: .leading
//                    )
//
//                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
//                    .padding(.bottom, 10)
//                    ,alignment: .bottom
//                )
            }
            .ignoresSafeArea()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct Cuttom_Previews: PreviewProvider {
    static var previews: some View {
        Cuttom()
    }
}

