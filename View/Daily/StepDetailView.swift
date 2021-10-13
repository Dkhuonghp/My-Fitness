//
//  StepDetailView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/19.
//

import SwiftUI

struct StepDetailView: View {
    var totalStep = 15000
    @State var animationInProgress = false
    @AppStorage("currentStep") var currentStep = 2500
    var body: some View {

        HStack(spacing: 40){
            
            Button(action: {
                if currentStep <= totalStep{
                    currentStep -= 2500
                }

                else{
                    currentStep = 2500
                }
                animationInProgress.toggle()
                
            }){
        
                Image(systemName: "minus")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.blue)
                    .cornerRadius(10)
                
            }
            
            ZStack{
                
                Circle()
                    .stroke(Color.gray,lineWidth: 15)
                Circle()
                    .trim(from: 0, to: CGFloat(currentStep) / CGFloat(totalStep))
                    //.stroke(Color.blue,lineWidth: 4)
                    .stroke(LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.blue]),
                                startPoint: .top,
                                endPoint: .trailing),
                            style: StrokeStyle(
                                lineWidth: 15,
                                lineCap: .round))
                    .rotationEffect(.degrees (-90))
                VStack{
                    
                    Text("\(currentStep)")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Image("steps")
                }
                
            }
            .animation(.default)
            .frame(width: 200, height: 200)
            
            Button(action: {
                if currentStep <= totalStep{
                    currentStep += 2500
                }
                else{
                    currentStep = 2500
                }
//                animationInProgress.toggle()
                
            }){
        
            Image(systemName: "plus")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(width: 45, height: 45)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }

    }
}

struct StepDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StepDetailView()
    }
}
