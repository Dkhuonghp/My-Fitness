//
//  TextAnimated.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/15.
//

import SwiftUI

struct TextAnimated: View {
    
    // Toggle For MultiColors...
    @State var multiColor = false
    
    var body: some View{
        
        VStack{
//
//            TextShimmer(text: "Welcome", multiColors: $multiColor)
//
//            TextShimmer(text: "To", multiColors: $multiColor)
            
            TextShimmer(text: "My Fitness", multiColors: $multiColor)
            
//            Toggle(isOn: $multiColor, label: {
//                Text("Enable Multi Colors")
//                    .font(.title)
//                    .fontWeight(.bold)
//            })
//            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

// TextShimmer....

struct TextShimmer: View {
    
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View{
        
        ZStack{
            
            Text(text)
                .font(.system(size: 55, weight: .bold))
                .foregroundColor(Color.white.opacity(0.5))
            
            // MultiColor Text....
            
            HStack(spacing: 0){
                
                ForEach(0..<text.count,id: \.self){index in
                    
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 55, weight: .bold))
//                        .foregroundColor(.red)
                }
            }
            // Masking For Shimmer Effect...
            .mask(
            
                Rectangle()
                    // For Some More Nice Effect Were Going to use Gradient...
                    .fill(
                    
                        // You can use any Color Here...
                        LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white,Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                // Moving View Continously...
                // so it will create Shimmer Effect...
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            )
            .onAppear(perform: {
            
                withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)){
                    
                    animation.toggle()
                }
            })
        }
    }
    
    // Random Color....
    
    // It's Your Wish yOu can change anything here...
    // or you can also use Array of colors to pick random One....
    
    func randomColor()->Color{
        
        let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        
        return Color(color)
    }
}

