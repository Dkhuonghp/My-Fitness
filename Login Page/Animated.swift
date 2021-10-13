//
//  Animated.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/15.
//

import SwiftUI

import SwiftUI

struct Animated: View {
    @State var animationInProgress = false
    @State var isActive: Bool = false
    var body: some View {
            
            ZStack(alignment: .bottomLeading){
                
                if self.isActive {
                    HomeView()
                    
                }else {
                
//                    Color(#colorLiteral(red: 0.01568627451, green: 0.3725490196, blue: 1, alpha: 1))
//                        .edgesIgnoringSafeArea(.all)
                    Image("bung")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                        .ignoresSafeArea()
                        .opacity(0.4)
//                Image("background-image")
//                    .resizable()
//                    .opacity(0.3)
//                    .offset(x: 0, y: 100)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 400)
//
//                Image("background-image")
//                    .resizable()
//                    .opacity(0.3)
//                    .offset(x: -UIScreen.main.bounds.width + 150, y: 30)
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 200)
//                    .rotation3DEffect(
//                        .degrees(180),
//                        axis: (x: 0.0, y: 1.0, z: 0.0)
//                        )
                
                    VStack{

                        Text("My Fitness")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(Color.white)
                            .shimmering()
                        
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                }
            }
            .background(Color.black)
            .ignoresSafeArea()
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        
    }
}


/// A view modifier that applies an animated "shimmer" to any view, typically to show that
/// an operation is in progress.
public struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = 0
    var duration = 3
    var bounce = false

    public func body(content: Content) -> some View {
        content
            .modifier(AnimatedMask(phase: phase).animation(
                Animation.linear(duration: Double(duration))
                    .repeatForever(autoreverses: bounce)
            ))
            .onAppear { phase = 0.8 }
    }

    /// An animatable modifier to interpolate between `phase` values.
    struct AnimatedMask: AnimatableModifier {
        var phase: CGFloat = 0

        var animatableData: CGFloat {
            get { phase }
            set { phase = newValue }
        }

        func body(content: Content) -> some View {
            content
                .mask(GradientMask(phase: phase).scaleEffect(3))
        }
    }

    /// A slanted, animatable gradient between transparent and opaque to use as mask.
    /// The `phase` parameter shifts the gradient, moving the opaque band.
    struct GradientMask: View {
        let phase: CGFloat
        let centerColor = Color.white
        let edgeColor = Color.white.opacity(0.3)

        var body: some View {
            LinearGradient(gradient:
                Gradient(stops: [
                    .init(color: edgeColor, location: phase),
                    .init(color: centerColor, location: phase + 0.1),
                    .init(color: edgeColor, location: phase + 0.2)
                ]), startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}

public extension View {
    /// Adds an animated shimmering effect to any view, typically to show that
    /// an operation is in progress.
    /// - Parameters:
    ///   - active: Convenience parameter to conditionally enable the effect. Defaults to `true`.
    ///   - duration: The duration of a shimmer cycle in seconds. Default: `1.5`.
    ///   - bounce: Whether to bounce (reverse) the animation back and forth. Defaults to `false`.
    @ViewBuilder func shimmering(
        active: Bool = true, duration: Double = 3, bounce: Bool = false
    ) -> some View {
        if active {
            modifier(Shimmer(duration: Int(duration), bounce: bounce))
        } else {
            self
        }
    }
}

#if DEBUG
struct Shimmer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("SwiftUI Shimmer")
            if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
                Text("SwiftUI Shimmer").preferredColorScheme(.light)
                Text("SwiftUI Shimmer").preferredColorScheme(.dark)
                VStack(alignment: .leading) {
                    Text("Loading...").font(.title)
                    Text(String(repeating: "Shimmer", count: 12))
                        .redacted(reason: .placeholder)
                }.frame(maxWidth: 200)
            }
        }
        .padding()
        .shimmering()
        .previewLayout(.sizeThatFits)
    }
}
#endif
