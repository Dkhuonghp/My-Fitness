//
//  OnBoardView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/26.
//

import SwiftUI

//struct OnboardingView : View{
//    @State var SliderGesture = CGSize.zero
//    @State var SliderOne = false
//    @State var SliderOnePreview = false
//    @State var SliderTwo = false
//    @State var SliderTwoPreview = false
//
//    var body: some View{
//
//        ZStack{
//
//            Color.white.edgesIgnoringSafeArea(.all)
//
//            OnboardingThree()
//                .offset(x: SliderGesture.width)
//                .offset(x: SliderTwo ? 0 : 500)
//                .animation(.spring())
//
//                .gesture(
//                    DragGesture().onChanged { value in
//                        self.SliderGesture = value.translation
//                    }
//                    .onEnded { value in
//                        if self.SliderGesture.width > 150 {
//                            self.SliderTwo = false
//                            self.SliderTwoPreview = true
//                        }
//                        self.SliderGesture = .zero
//                    }
//                )
//
//
//            OnboardingTwo()
//                .offset(x: SliderGesture.width)
//                .offset(x: SliderOne ? 0 : 500)
//                .offset(x: SliderOnePreview ? 500 : 0)
//                .offset(x: SliderTwo ? -500 : 0)
//
//                .animation(.spring())
//
//                .gesture(
//                    DragGesture().onChanged { value in
//                        self.SliderGesture = value.translation
//                    }
//                    .onEnded { value in
//                        if self.SliderGesture.width < -150 {
//                            self.SliderOne = true
//                            self.SliderTwo = true
//                        }
//
//                        if self.SliderGesture.width > 150 {
//                            self.SliderOnePreview = true
//                            self.SliderOne = false
//                        }
//                        self.SliderGesture = .zero
//                    }
//                )
//
//
//
//            OnboardingOne()
//                .offset(x: SliderGesture.width)
//                .offset(x: SliderOne ? -500 : 0)
//
//                .animation(.spring())
//
//                .gesture(
//                    DragGesture().onChanged { value in
//                        self.SliderGesture = value.translation
//                    }
//                    .onEnded { value in
//                        if self.SliderGesture.width < -150 {
//                            self.SliderOne = true
//                            self.SliderOnePreview = false
//                        }
//                        self.SliderGesture = .zero
//                    }
//                )
//
//
//
//
//
//            VStack {
//                Spacer()
//                ZStack {
//                    VStack{
//
//                        Text("Complete")
//                            .font(.system(size: 17, weight: .medium, design: .rounded))
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: 140, height: 40)
//                    .background(Color.green)
//                    .offset(x: SliderTwo ? 0 : 500)
//                    .cornerRadius(20)
//                    .animation(.spring())
//
//
//                    VStack{
//
//                        Text("Skip")
//                            .font(.system(size: 17, weight: .medium, design: .rounded))
//                            .foregroundColor(.white)
//                    }
//                    .frame(width: 140, height: 40)
//                    .background(Color.black)
//                    .offset(x: SliderTwo ? -500 : 0)
//                    .cornerRadius(20)
//                    .animation(.spring())
//                }
//            }
//        }
//    }
//}

//struct OnboardingView: View {
//
//    @AppStorage("currentPage") var currentPage = 1
//
//    @State var SlideGesture = CGSize.zero
//    @State var SlideOne = false
//    @State var SlideOnePrevious = false
//    @State var SlideTwo = false
//    @State var SlideTwoPrevious = false
//
//
//    var body: some View {
//        ZStack {
//            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)
//
//                OnboardingThree()
//                    .offset(x: SlideGesture.width)
//                    .offset(x: SlideTwo ? 0 : 500)
//                    .animation(.spring())
//
//                    .gesture(
//                        DragGesture().onChanged { value in
//                            self.SlideGesture = value.translation
//                        }
//                        .onEnded { value in
//                            if self.SlideGesture.width > 150 {
//                                self.SlideTwo = false
//                                self.SlideTwoPrevious = true
//                            }
//                            self.SlideGesture = .zero
//                        }
//                )
//
//                OnboardingTwo()
//                    .offset(x: SlideGesture.width)
//                    .offset(x: SlideOne ? 0 : 500)
//                    .offset(x: SlideOnePrevious ? 500 : 0)
//                    .offset(x: SlideTwo ? -500 : 0)
//                    .animation(.spring())
//
//                    .gesture(
//                        DragGesture().onChanged { value in
//                            self.SlideGesture = value.translation
//                        }
//                        .onEnded { value in
//                            if self.SlideGesture.width < -150 {
//                                self.SlideOne = true
//                                self.SlideTwo = true
//
//                            }
//
//                            if self.SlideGesture.width > 150 {
//                                self.SlideOnePrevious = true
//                                self.SlideOne = false
//
//                            }
//                            self.SlideGesture = .zero
//                        }
//                )
//
//                OnboardingOne()
//                    .offset(x: SlideGesture.width)
//                    .offset(x: SlideOne ? -500 : 0)
//
//                    .animation(.spring())
//
//                    .gesture(
//                        DragGesture().onChanged { value in
//                            self.SlideGesture = value.translation
//                        }
//                        .onEnded { value in
//                            if self.SlideGesture.width < -150 {
//                                self.SlideOne = true
//                                self.SlideOnePrevious = false
//                            }
//                            self.SlideGesture = .zero
//                        }
//                )
//        }
////        .overlay(
////
////            Button(action: {
////                withAnimation(.easeInOut) {
////                    if currentPage <= total {
////                        currentPage += 1
////                    }else{
////                        currentPage -= 1
////                    }
////                }
////            }, label: {
////
////                VStack {
////                    Text("Skip")
////                        .font(.system(size: 17, weight: .medium, design: .rounded))
////                        .foregroundColor(Color.white)
////                }
////                .frame(width: 140, height: 40)
////                .background(Color.black)
////                .cornerRadius(20)
////                .animation(.spring())
////                .offset(x: SlideTwo ? -500 : 0)
////
////            })
////        )
//    }
//}




struct OnBordingView: View {
    @AppStorage("currentPage") var currentPage = 1

    var body: some View{
        
        ZStack {
            Player()
        }

        .overlay(
            VStack{
                Button(action: {
                    withAnimation(.easeInOut) {
                        if currentPage <= total {
                            currentPage += 1
                        }else{
                            currentPage -= 1
                        }
                    }
                }, label: {

                    VStack {
                        HStack{
                            Image(systemName: "applelogo")
                                .foregroundColor(.white)
                            Text("Continue with Apple")
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.black)
                    .cornerRadius(50)
                })
                .padding(.bottom, 1)
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        if currentPage <= total {
                            currentPage += 1
                        }else{
                            currentPage -= 1
                        }
                    }
                }, label: {

                    VStack {
                        HStack{
                            Image(systemName: "applelogo")
                                .foregroundColor(.white)
                            Text("Continue with Email")
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color("Color"))
                    .cornerRadius(50)
                })
                .padding(.bottom, 1)
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        if currentPage <= total {
                            currentPage += 1
                        }else{
                            currentPage -= 1
                        }
                    }
                }, label: {

                    VStack {
                        HStack{
                            Image(systemName: "")
                                .foregroundColor(.white)
                            Text("Continue with Facebook")
                                .font(.system(size: 17, weight: .medium, design: .rounded))
                                .foregroundColor(Color.white)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.blue)
                    .cornerRadius(50)
                })
            }
            .offset(x: 0, y: 0), alignment: .bottom
        )
    }
}

var total = 2

