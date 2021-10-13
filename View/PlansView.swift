//
//  PlansView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/21.
//

import SwiftUI

struct PlansView: View {
    var colors: [Color] = [.red,.blue,.pink,.purple]
    @State var offset: CGFloat = 0
    @State var isActive: Bool = false

    
    var body: some View {
        
        
        VStack{
            
            ZStack {


                    HStack{

                        VStack{

                            Text("PLAN")
                                .font(.system(size: 26))
                                .fontWeight(.bold)
                                .foregroundColor(.black)

                            HStack(spacing: 15){
                                ForEach(colors.indices, id: \.self){index in
                                    Rectangle()
                                        .fill(Color.black)
                                        .frame(width: 5, height: 5)
                                }
                            }
                            .offset(y: -17)
                        }

                        Spacer()

                        Image(systemName: "star")
                            .font(.system(size: 24))
                            .foregroundColor(.black)

                    }
                    .padding(.horizontal)
            }

            ScrollView(.init()){
                
                TabView{
                    
                    GridView(rootIsActive: $isActive)
                    
                    GridView(rootIsActive: $isActive)

                    GridView(rootIsActive: $isActive)




                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .ignoresSafeArea()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}
