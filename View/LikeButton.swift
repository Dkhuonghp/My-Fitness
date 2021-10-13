//
//  LikeButton.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/25.
//

import SwiftUI

// Animation effect that applies parabolic path to the hearts appearing out of the center
// of the heart icon
struct HeartEffect: GeometryEffect {
    var offsetValue: Double
    var target: CGFloat

    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let reducedValue: Double = offsetValue - floor(offsetValue)
        let translation = CGFloat(Double(target) * pow(reducedValue, 1/4)) - CGFloat(Double(target) * reducedValue)
        let affineTransform = CGAffineTransform(translationX: translation, y: 0)
        return ProjectionTransform(affineTransform)
    }
}

// Animation effect that applies small shake to the left and right with some angular rotation
// when active icon is moving from active to inactive state
struct Shake: GeometryEffect {
    var amount: CGFloat = 5
    var shakesPerUnit = 3
    var offsetValue: Double
    
    var animatableData: Double {
        get { offsetValue }
        set { offsetValue = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let angle = sin(-2 * Double.pi * offsetValue) * 0.1
        
        let affineTransform = CGAffineTransform(translationX: size.width * 0.5, y: size.height)
            .rotated(by: CGFloat(angle))
            .translatedBy(
                x: -size.width * 0.5 + (amount * sin(CGFloat(offsetValue) * .pi * CGFloat(shakesPerUnit))),
                y: -size.height
            )
        
        return ProjectionTransform(affineTransform)
    }
}

// Structure to hold animated background hearts target positions, color and saturation
struct Heart: Hashable {
    var size: CGFloat = 15
    var duration: Double = 1.5
    var color: Color = Color.red
    var saturation: Double = 1
    var x: CGFloat = 0
    var y: CGFloat = 0
}

struct SpotifyLike: View {
    @State private var touch: Bool = false
    @State private var start: Bool = true
    @State private var finish: Bool = false
    @State private var animate: Double = 0
    
    // Using closure for simplicty's sake which generates an array of Heart objects.
    // Each heart depending on its position in an array receives size, saturation and y parameters
    // based on couple of trigonometric functions.
    private var heartsData: [Heart] {
        var hearts: [Heart] = []
        for i in 0...10 {
            
            hearts.append(Heart(
                size: scaleValue(i, 3),
                saturation: scaleSaturation(i, 2),
                x: -60 + CGFloat(Double(i) * 12),
                y: -50 + scaleVertical(i, 2)
            ))
 
        }
        return hearts
    }
    
    var body: some View {
        ZStack {

            // Background Hearts should be in the background
            if self.start {
                hearts
            }

            // Primary Icon button with active an inactive state
            
                
            ZStack {
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(touch ? 0 : 1)
                    .foregroundColor(Color.black)
                    .animation(Animation.easeInOut(duration: 0.2))
                    .modifier(Shake(offsetValue: self.finish ? self.animate : 0))
                
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(touch ? 1 : 0)
                    .foregroundColor(Color(UIColor.systemRed))
                    .animation(Animation.easeInOut(duration: 0.2))
                    .scaleEffect(touch ? 1 : 0.7)
                    .animation(Animation.timingCurve(0.01, 2, 0.65, 0.65, duration: 0.5))
            }
            .frame(width: 60)



            // This section renders 3 Circles create simple ripple effect. Each Circle is animated a bit after previous one.
            if self.start {
                Circle()
                    .fill(Color.red)
                    .opacity(touch ? 1 : 0)
                    .frame(width: 90)
                    .mask(
                        Circle()
                            .scale(x: touch ? 1 : 0.5, y: touch ? 1 : 0.5)
                            .stroke(lineWidth: touch ? 0 : 10)
                    )
                    .animation(Animation.easeInOut(duration: 0.4))
                
                Circle()
                    .fill(Color.red)
                    .opacity(touch ? 1 : 0)
                    .frame(width: 110)
                    .mask(
                        Circle()
                            .scale(x: touch ? 1 : 0.4, y: touch ? 1 : 0.4)
                            .stroke(lineWidth: touch ? 0 : 10)
                    )
                    .animation(Animation.easeInOut(duration: 0.4).delay(0.1))

                
                Circle()
                    .fill(Color.red)
                    .opacity(touch ? 1 : 0)
                    .frame(width: 120)
                    .mask(
                        Circle()
                            .scale(x: touch ? 1 : 0.3, y: touch ? 1 : 0.3)
                            .stroke(lineWidth: touch ? 0 : 10)
                    )
                    .animation(Animation.easeInOut(duration: 0.4).delay(0.2))
            }
        }
        .frame(width: 120)
        .onTapGesture{
            self.touch.toggle()

            // We have to keep track of start and finish state to make sure that some
            // elements of the animation are shown during inactive -> active transition
            // and hidden during active -> inactive transition
            if self.touch {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    if self.touch {
                        self.finish = true
                    }
                }
            } else {
                self.start = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if !self.touch {
                        self.start = true
                        self.finish = false
                    }
                }
            }

            withAnimation(Animation.easeInOut(duration: 0.5).delay(0.2)) {
                self.animate += 1
            }
        }
    }

    private var hearts: some View {
        ZStack {
            ForEach(heartsData, id: \.self) { heart in
                Image(systemName: "heart.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: heart.size, height: heart.size)
                    .foregroundColor(heart.color)
                    .saturation(heart.saturation)
                    .opacity(self.touch ? 1 : 0)
                    .offset(x: self.touch ? heart.x : 0, y: self.touch ? heart.y : 20)
                    .animation(Animation.easeInOut(duration: 0.5).delay(0.2))
                    .opacity(self.touch ? 0 : 1)
                    .animation(Animation.linear(duration: 0.3).delay(0.4))
                    .modifier(HeartEffect(offsetValue: self.animate, target: heart.x))
            }
        }
    }

    // Returns desired size of a Heart based on its position in an array using cosine function
    func scaleValue(_ idx: Int, _ total: Int) -> CGFloat {
        let x = Double(idx) / Double(total)
        let y = (cos(2 * .pi * x) + 1) / 2.0
        return 10 + 15 * CGFloat(y)
    }

    // Returns color saturation of a Heart based on its position in an array using cosine function
    func scaleSaturation(_ idx: Int, _ total: Int) -> Double {
        let x = Double(idx) / Double(total)
        let y = (cos(.pi * x))
        return 0.3 + y
    }

    // Returns desired vertical offset of a Heart based on its position in an array using sine function
    func scaleVertical(_ idx: Int, _ total: Int) -> CGFloat {
        let x = Double(idx) / Double(total)
        let y = (sin(.pi * x))
        return 5 + 30 * CGFloat(y)
    }
}
