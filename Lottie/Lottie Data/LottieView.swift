//
//  LottieView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/08/03.
//

import SwiftUI
import Lottie

//struct LottieView: UIViewRepresentable {
//    func makeUIView(context: Context) -> some AnimationView {
//
//        let LottieAnimationView = AnimationView(name: "lottie")
//        LottieAnimationView.play()
//        return LottieAnimationView
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//
//    }
//}
struct  LottieView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("lottie")

        animationView.animation = animation
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}

struct  LottieView2: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LottieView2>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("lottie2")

        animationView.animation = animation
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}


struct  LottieView3: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LottieView3>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("lottie3")

        animationView.animation = animation
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}

struct  LottieView4: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LottieView4>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("lottie4")

        animationView.animation = animation
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}

struct  LottieView5: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LottieView5>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("lottie5")

        animationView.animation = animation
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}


struct  LottieView6: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LottieView6>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("lottie6")

        animationView.animation = animation
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}


struct  LottieView7: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<LottieView7>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("lottie7")

        animationView.animation = animation
        animationView.contentMode = .scaleToFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}

struct  Music: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Music>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named("music")

        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.play()
        animationView.loopMode = .loop
        
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
        
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        
    }
}







