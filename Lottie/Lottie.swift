//
//  Lottie.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/08/03.
//

import SwiftUI

struct Lottie4: View {
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isShowingSheet = false

    var body: some View {

        VStack{
            
            LottieView4()
                .frame(height: UIScreen.main.bounds.height / 2)
                .padding(.vertical)
                
            HStack{
                
                Text("JUMPING JACKS")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Button(action: {
                    isShowingSheet.toggle()
                    
                }, label: {
                    
                    Image(systemName: "info.circle")
                        .foregroundColor(.gray)
                })
                .sheet(isPresented: $isShowingSheet,
                       onDismiss: didDismiss) {
                    VStack {
                        
                        Button("Dismiss",
                               action: { isShowingSheet.toggle() })
                    }
                }
            }
            
            HStack{
                Text("00 : \(self.count)")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .padding()
            }
                            
            ZStack{
                
//                Circle()
//                    .trim(from: 0, to: 1)
//                    .stroke(Color.gray.opacity(0.1), style: StrokeStyle(lineWidth: 4, lineCap: .round))
//                    .frame(width: 90, height: 90)

                Circle()
                    .trim(from: 0, to: self.to)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 90, height: 90)
                    .rotationEffect(.init(degrees: -90))
                
                Button(action: {
                    
                    if self.count == 30{
                        
                        self.count = 0
                        withAnimation(.default){
                            
                            self.to = 0
                        }
                    }
                    self.start.toggle()
                    
                }) {
                    
                    ZStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 75, height: 75)
                        Image(systemName: self.start ? "pause.fill" : "play.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding(.vertical)
        .onAppear(perform: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        })
        .onReceive(self.time) { (_) in
            
            if self.start{
                
                if self.count != 30{
                    
                    self.count += 1
                    print("hello")
                    
                    withAnimation(.default){
                        
                        self.to = CGFloat(self.count) / 30
                    }
                }
                else{
                
                    self.start.toggle()
                }

            }
            
        }
    }
    func didDismiss() {
         // Handle the dismissing action.
     }
}

struct Lottie: View {
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {

        VStack{
            
            LottieView()
                .frame(height: UIScreen.main.bounds.height / 2)
                .padding(.vertical)
                
            HStack{
                
                Text("PUSH-UPS")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            
            HStack{
                Text("00 : \(self.count)")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                    .padding()
            }
                            
            ZStack{

                Circle()
                    .trim(from: 0, to: self.to)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 90, height: 90)
                    .rotationEffect(.init(degrees: -90))
                
                Button(action: {
                    
                    if self.count == 30{
                        
                        self.count = 0
                        withAnimation(.default){
                            
                            self.to = 0
                        }
                    }
                    self.start.toggle()
                    
                }) {
                    
                    ZStack{
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 75, height: 75)
                        Image(systemName: self.start ? "pause.fill" : "play.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding(.vertical)
        .onAppear(perform: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        })
        .onReceive(self.time) { (_) in
            
            if self.start{
                
                if self.count != 15{
                    
                    self.count += 1
                    print("hello")
                    
                    withAnimation(.default){
                        
                        self.to = CGFloat(self.count) / 15
                    }
                }
                else{
                
                    self.start.toggle()
                }

            }
            
        }
    }
}

struct Lottie2: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

        
        VStack{
            
            LottieView2()
                .frame(height: UIScreen.main.bounds.height / 2)
                .padding(.vertical)
            HStack{
                
                Text("PUSH-UPS")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            Text("x 12")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .padding()
            
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 90, height: 90)
                Image(systemName: "checkmark")
                    .font(.system(size: 30,weight: .heavy))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
    }
}

struct Lottie3: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

        
        VStack{
            
            LottieView3()
                .frame(height: UIScreen.main.bounds.height / 2)
                .padding(.vertical)
            
            HStack{
                
                Text("PUSH-UPS")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            Text("x 12")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .padding()
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 90, height: 90)
                Image(systemName: "checkmark")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
    }
}

struct Lottie5: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

        
        VStack{
            
            LottieView5()
                .frame(height: UIScreen.main.bounds.height / 2)
                .padding(.vertical)
            
            HStack{
                
                Text("PUSH-UPS")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            Text("x 12")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .padding()
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 90, height: 90)
                Image(systemName: "checkmark")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
    }
}

struct Lottie6: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

        
        VStack{
            
            LottieView6()
                .frame(height: UIScreen.main.bounds.height / 2)
                .padding(.vertical)
            
            HStack{
                
                Text("PUSH-UPS")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            Text("x 12")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .padding()
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 90, height: 90)
                Image(systemName: "checkmark")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
    }
}

struct Lottie7: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {

        
        VStack{
            
            LottieView7()
                .frame(height: UIScreen.main.bounds.height / 2)
                .padding(.vertical)
            
            HStack{
                
                Text("PUSH-UPS")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Image(systemName: "info.circle")
                    .foregroundColor(.gray)
            }
            Text("x 12")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.blue)
                .padding()
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 90, height: 90)
                Image(systemName: "checkmark")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical)
    }
}

struct Lottie_Previews: PreviewProvider {
    static var previews: some View {
        Lottie()
    }
}
