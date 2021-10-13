//
//  StartButton.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/08/05.
//

import SwiftUI

struct StartButton: View {
    @State var showFilter = false
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State private var isShowingSheet = false

    
    var body: some View {
        
        ZStack{
            // Map View...
            StartWorkout()
            VStack{
                // Radio Button View

                VStack{
                    
                    Spacer()
                    
                    ZStack(alignment: .bottom){
                        
                        HStack{

                            Button(action: {
                                
                                withAnimation{showFilter.toggle()}
                                
                            }, label: {
                                
                                Image(systemName: "music.note.list")
                                    .font(.title2)
                                    .foregroundColor(.black)

                            })
                            Spacer()
                            Text("")
                                .font(.callout)
                                .foregroundColor(.gray)
                            Spacer()
                            
                            Image(systemName: "list.bullet")
                                .font(.title2)
                                .foregroundColor(.black)
                            
                        }
                        .padding(.bottom, 50)
                        .padding(.horizontal, 50)
                        
                        VStack(alignment: .leading){
                            
                            Text("Music")
                                .font(.callout)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                                .padding(.vertical)
                            
                            ScrollView{
                                MusicPlayer()
                                    .padding(.vertical)

                                MusicPlayer2()
                                    .padding(.vertical)

                            }

                        }
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                        .padding(.bottom,edges?.bottom)
                        .padding(.top, 10)
                        .background(Color.white.clipShape(CustomCorner(corners: [.topLeft,.topRight])))
                        .offset(y: 100)
                        .offset(y: showFilter ? 0 : UIScreen.main.bounds.height / 1)
                        
                    }
                    
                }
                
                .ignoresSafeArea()
                .background(
                    Color.black.opacity(0.2).ignoresSafeArea()
                        .opacity(showFilter ? 1 : 0)
                    
                    //you can also add close here
                        .onTapGesture(perform: {

                            withAnimation{showFilter.toggle()}
                        })
                )
            }
        }
    }
    func didDismiss() {
        // Handle the dismissing action.
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
    }
}
