//
//  ScreenUI.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/19.
//

import SwiftUI

struct ScreenUI: View {
    var colors: [Color] = [.red,.blue,.pink,.purple]
    @State var offset: CGFloat = 0
    @State var ringring = false

    
    var body: some View {
        
        
        VStack{
            
            VStack {
                
                HStack{
                    Text("Daily")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(.horizontal)
                
                HStack(spacing: 30){
                    
                    Text("Daily")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text("Calendar")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.vertical)
                .padding(.horizontal)

            }
            .background(
                Ellipse()
                    .fill(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
                    .frame(width:900, height: 500)
                    .offset(y: -100)
            )
            ScrollView(.init()){
                
                TabView{
                    
//                    ForEach(colors.indices,id: \.self){index in
//                        if index == 1{
//
//                            colors[index]
//                                .overlay(
//                                    //getometry Reader for getting offset...
//
//                                    GeometryReader{proxy -> Color in
//
//                                        let minX = proxy.frame(in: .global).minX
//
//                                        DispatchQueue.main.async {
//                                            withAnimation(.default){
//
//                                                self.offset = -minX
//                                            }
//                                        }
//
//                                        return Color.clear
//                                    }
//                                    .frame(width: 0, height: 0)
//                                    ,alignment: .leading
//
//                                )
//                        }
//                        else{
//
//                            colors[index]
//                        }
//
//                    }
                    LevelTest()
                    
                    CalenderView()

                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
                
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
//            .ignoresSafeArea()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }

//    func getIndex()->Int{
//
//        let index = Int(round(Double(offset / getWidth())))
//
//        return index
//    }
//
//    func getOffset()->CGFloat{
//
//        let progress = offset / getWidth()
//
//        return 22 * progress
//    }
//}
//
//extension View{
//
//    func getWidth()->CGFloat{
//
//        return UIScreen.main.bounds.width
//    }
//}





}
struct ScreenUI_Previews: PreviewProvider {
    static var previews: some View {
        ScreenUI()
    }
}
