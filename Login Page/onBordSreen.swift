//
//  onBordSreen.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/05.
//

import SwiftUI

struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}

private let onBoardingStep = [

    OnBoardingStep(image: "", title: "Wellcome", description: "wellcome"),
    OnBoardingStep(image: "", title: "Title1", description: "Title1"),
    OnBoardingStep(image: "", title: "Title2", description: "Title2"),
    OnBoardingStep(image: "", title: "Title2", description: "Title2"),
    OnBoardingStep(image: "", title: "Title2", description: "Title2"),
]
struct onBaordSreen: View{
    @State var maxWidth = UIScreen.main.bounds.width - 100
    @State var offset : CGFloat = 0
    @State private var showLink = false
    @State var goToHome = false
    @State private var currentStep = 0
    
    init() {

        UIScrollView.appearance().bounces = false
    }


    var body: some View{
        
        NavigationView{
            
            ZStack{
    
                Color(.gray)
                    .ignoresSafeArea(.all, edges: .all)
                    .opacity(0.08)
                
                VStack{
                                            
                        TabView(selection: $currentStep){
                            ForEach(0..<onBoardingStep.count) { it in
                                
                                VStack{
//
//                                    LottieView2()
//                                        .frame(width: 100, height: 100)
//                                    LottieView()
//                                        .frame(width: 100 , height: 100)
                                    Text(onBoardingStep[it].title)
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                    Text(onBoardingStep[it].description)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 32)
                                }
                                .tag(it)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    HStack{
                        
                        ForEach(0..<onBoardingStep.count) { it in
                            
                            if it == currentStep{
                                
                                Rectangle()
                                   .frame(width: 20, height: 10)
                                   .foregroundColor(.blue)
                                   .cornerRadius(10)
                                
                            }else{
                                
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(.gray)
                                
                            }
                        }
                    }
                    .padding(.bottom, 24)
                    
                    Spacer(minLength: 0)
                    
                    //slider
                    
                    ZStack{
                        
                        Capsule()
                            .fill(Color.white)
                        
                        Text("HOME TO START")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.leading, 30)
                        HStack{
                            Capsule()
                                .fill(Color.gray.opacity(0.5))
                                .frame(width: calculateWidth() + 65)
                            
                            Spacer(minLength: 0)
                        }
                        
                        HStack{
                            
                            ZStack{
                                
                                Image(systemName: "chevron.right")
                                
                                Image(systemName: "chevron.right")
                                    .offset(x: -10)

                            }
                            .foregroundColor(.white)
                            .offset(x: 4)
                            .frame(width: 65, height: 65)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: offset)
                            .gesture(DragGesture().onChanged(onChanged(value:))
                                        .onEnded(onEnd(value:)))
                            
                            
                            Spacer()
                        }
                    }
                    .frame(width: maxWidth, height: 65)
                    .padding(.bottom)
                }
            }

        }
    }
    func calculateWidth() -> CGFloat{
        
        let percent = offset / maxWidth
        
        return percent * maxWidth
    }
    
    func onChanged(value: DragGesture.Value){
        
        //Updating...
        if value.translation.width > 0 && offset <= maxWidth - 65 {
            
            offset = value.translation.width

        }
    }
    
    func onEnd(value: DragGesture.Value){
        
        //back off animation..
        
        withAnimation(Animation.easeOut(duration: 0.3)){
            
            if offset > 180{
                
                offset = maxWidth - 65
                //notification
                
                //delaying
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    
                    NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
                }
            }
            else {
                offset = 0
            }
        }
    }
}

