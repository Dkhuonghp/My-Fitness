//
//  ScrollableTabBar.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/19.
//

import SwiftUI

struct ScrollableTabBar: View {
    @State var isActive: Bool = false
    @Binding var rootIsActive: Bool

    let spacing: CGFloat = 10
    @State private var  numberOfRows = 1
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
                
                headerView
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .offset(y: 150)
                    
                    VStack(alignment: .leading){
                        
                        
                        Text("DAY")
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Intermediate")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                Text("Level")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                            }

                            Spacer()
                            VStack(alignment: .leading){
                                
                                Text("13 Mins")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Text("Time")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                            }

                            Spacer()
                            VStack(alignment: .leading){
                                Text("100 Kcal")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Text("Calorie")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                            }

                        }
                        .padding(.vertical, 20)
                        
                        NavigationLink(
                            destination: Text("Destination"),
                            label: {
                                Text("Sound & Music")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                            })
                        HStack(spacing: 5){
                            Text("Exercises")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                            Text("(16)")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                
                        }
                    }
                    .padding(.horizontal)

                }
            
        }
        .navigationBarHidden(true)

    }
    var headerView: some View{
        LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders] , content: {
            //
            GeometryReader{reader -> AnyView in
                
                let offset = reader.frame(in: .global).minY
                
                return AnyView(
                    
                    Image("")
                        .resizable()
                        .background(Color.gray)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 200 + (offset > 0 ? offset : 0))
                        .cornerRadius(2)
                        .offset(y: (offset > 0 ? -offset : 0))
//                        .overlay(
//
//                            HStack{
//
//                                Button(action: {}, label: {
//                                    Image(systemName: "chevron.left")
//                                        .font(.system(size: 20, weight: .bold))
//                                        .foregroundColor(.white)
//                                })
//                                Spacer()
//
//                                Button(action: {}, label: {
//                                    Image(systemName: "suit.heart.fill")
//                                        .font(.system(size: 20, weight: .bold))
//                                        .foregroundColor(.white)
//                                })
//                                Button(action: {}, label: {
//                                    Image(systemName: "info.circle")
//                                        .font(.system(size: 20, weight: .bold))
//                                        .foregroundColor(.white)
//                                })
//                            }
//                            .padding(),
//                            alignment: .top
//                        )
                )
            }
            .frame(height: 200)
        })
    }
}
