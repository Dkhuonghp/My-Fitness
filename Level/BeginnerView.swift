//
//  BeginnerView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/24.
//

import SwiftUI

struct BeginnerView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isLiked: Bool
        var body: some View {
            VStack {
                
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)

                    })

                    Spacer()
                    
                    Button(action: {
                        
                        self.isLiked.toggle()
                        
                    }, label: {
                        
                        
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .foregroundColor(isLiked ? .red : . black)
                            .font(.system(size: 22))

                    })
                }
                .padding(.horizontal)
                
                VStack{
                    ZStack{
                        Image("full body")
                              .resizable()
                              .ignoresSafeArea()
                              .frame(height: 250)
                              .opacity(0.7)
                        Text("BEGINNER")
                        
                    }
              
                }
                .background(Color.black)
                .cornerRadius(10)
                .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                .padding(.horizontal)
                .padding(.bottom, 10)

                ScrollView(.vertical,showsIndicators: false)  {
                    //            Product Image
                    BeginnerDetailView()

                }
                .edgesIgnoringSafeArea(.top)
                
            }
//            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
}


struct BeginnerDetailView: View {
    @State private var isLiked = false
    var body: some View {
        VStack(alignment: .leading){
            
            VStack(alignment: .leading){
                
                NavigationLink(
                    destination: DetailScreen(isLiked: $isLiked),
                    label: {
                        VStack{
                            
                            ForEach(1...16, id: \.self) {img in
                                
                                Image("full body\(img)")
                                    .frame(width: 380, height: 80)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                    })
            }
        }
        .padding(.horizontal)
        .background(Color(.white))
    }
}

