//
//  LevelUp.swift
//  Plant Activity Tracker
//
//  Created by NGUYEN DUY KHUONG on 2021/07/12.
//

import SwiftUI

struct LevelUp: View {
    @State var isActive: Bool = false
    @Binding var rootIsActive: Bool
    
    var body: some View {
        
            
        VStack(alignment: .leading) {
            
            ZStack{

                ScrollView{
                    
                    VStack(alignment: .center){
                        
                        // Trình độ đơn giản
                        VStack{

                            NavigationLink(
                                      destination: calender(rootIsActive: self.$isActive),
                                isActive: self.$isActive,
                                      label: {

                                        VStack{

                                              ZStack{

                                                  Image("tay")
                                                    .frame(alignment: .trailing)
                                                    .opacity(0.7)
                                                VStack(alignment: .center){
                                                    
                                                    HStack{
                                                        
                                                        
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17))
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .opacity(0.4)
                                                            .font(.system(size: 17))
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .opacity(0.4)

                                                            .font(.system(size: 17))
                                                    }
                                                        Text("Beginner")
                                                          .font(.system(size: 24))
                                                          .fontWeight(.semibold)
                                                          .foregroundColor(.white)
                                                        .padding(.top, 5)
                                                    }
                                                }
                                            }
                                        })
                                .foregroundColor(.white)
                                .frame(width: 380, height: 160, alignment: .center)
                        }
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)
                        
                        //Trình độ trung bình
                        VStack{

                            NavigationLink(
                                      destination: calender(rootIsActive: self.$isActive),
                                isActive: self.$isActive,
                                      label: {

                                        VStack{

                                              ZStack{

                                                  Image("tay 2")
                                                    .frame(alignment: .trailing)
                                                    .opacity(0.7)
                                                VStack(alignment: .center){
                                                    
                                                    HStack{
                                                        
                                                        
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17))
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17))
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .opacity(0.4)

                                                            .font(.system(size: 17))
                                                    }
                                                        Text("Intermediate")
                                                          .font(.system(size: 24))
                                                          .fontWeight(.semibold)
                                                          .foregroundColor(.white)
                                                        .padding(.top, 5)
                                                    }
                                                }
                                            }
                                        })
                                .foregroundColor(.white)
                                .frame(width: 380, height: 160, alignment: .center)
                        }
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)

                        // Trình độ khó
                        VStack{

                            NavigationLink(
                                      destination: calender(rootIsActive: self.$isActive),
                                isActive: self.$isActive,
                                      label: {

                                        VStack{

                                              ZStack{

                                                  Image("full body")
                                                    .frame(alignment: .trailing)
                                                    .opacity(0.7)
                                                VStack(alignment: .center){
                                                    
                                                    HStack{
                                                        
                                                        
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17))
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17))
                                                        Image(systemName: "flame.fill")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 17))
                                                    }
                                                        Text("Advanced")
                                                          .font(.system(size: 24))
                                                          .fontWeight(.semibold)
                                                          .foregroundColor(.white)
                                                        .padding(.top, 5)
                                                    }
                                                }
                                            }
                                        })
                                .foregroundColor(.white)
                                .frame(width: 380, height: 160, alignment: .center)
                        }
                        .background(Color.black)
                        .cornerRadius(10)
                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 10)
                        
                    }
                }
            }
        }
    }
}

struct Levels: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}
