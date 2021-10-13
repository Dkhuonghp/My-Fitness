//
//  DetailScreen.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/24.
//

import SwiftUI
import YoutubeKit
//struct DetailScreen: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    var body: some View {
//        ZStack {
//            Color(.white)
//            ScrollView(showsIndicators: false)  {
//                //            Product Image
//
//                headerView
//                Spacer(minLength: 0)
//
//
//                DescriptionView()
//
//            }
//            .edgesIgnoringSafeArea(.top)
//
//        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(false)
//        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: InfoButton())
//    }
//    var headerView: some View{
//        LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders] , content: {
//            //
//            GeometryReader{reader -> AnyView in
//
//                let offset = reader.frame(in: .global).minY
//
//                return AnyView(
//
//                    Image("full body")
//                        .resizable()
//                        .background(Color.black)
//                        .opacity(0.8)
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
//                        .offset(y: (offset > 0 ? -offset : 0))
//                )
//            }
//            .frame(height: 250)
//        })
//    }
//
//}
//
//
//struct RoundedCorner: Shape {
//
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
//
//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//
//struct DetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailScreen()
//    }
//}
//
//
//struct ColorDotView: View {
//    let color: Color
//    var body: some View {
//        color
//            .frame(width: 24, height: 24)
//            .clipShape(Circle())
//    }
//}
//
//struct DescriptionView: View {
//    var body: some View {
//        VStack(alignment: .leading){
//
//            Text("DAY")
//
//            HStack{
//                VStack(alignment: .leading){
//                    Text("Intermediate")
//                        .foregroundColor(.black)
//                        .font(.system(size: 15))
//                        .fontWeight(.semibold)
//                    Text("Level")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 12))
//                }
//
//                Spacer()
//                VStack(alignment: .leading){
//
//                    Text("13 Mins")
//                        .foregroundColor(.black)
//                        .font(.system(size: 15))
//                        .fontWeight(.semibold)
//
//                    Text("Time")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 12))
//                }
//
//                Spacer()
//                VStack(alignment: .leading){
//                    Text("100 Kcal")
//                        .foregroundColor(.black)
//                        .font(.system(size: 15))
//                        .fontWeight(.semibold)
//
//                    Text("Calorie")
//                        .foregroundColor(.gray)
//                        .font(.system(size: 12))
//                }
//
//            }
//            .padding(.vertical, 20)
//
//            NavigationLink(
//                destination: Text("Destination"),
//                label: {
//                    Text("Sound & Music")
//                        .font(.system(size: 16))
//                        .foregroundColor(.black)
//                        .fontWeight(.bold)
//                })
//                .padding(.vertical, 20)
//
//            HStack(spacing: 5){
//                Text("Exercises")
//                    .font(.system(size: 16))
//                    .foregroundColor(.black)
//                Text("(16)")
//                    .foregroundColor(.gray)
//                    .font(.system(size: 12))
//                    .fontWeight(.semibold)
//
//            }
//
//            VStack(alignment: .leading){
//
//
//                ForEach(1...16, id: \.self) {img in
//                    Image("full body\(img)")
//                        .frame(width: 80, height: 80)
//                        .background(Color.gray)
//                        .cornerRadius(10)
//                    Divider()
//
//                }
//            }
//        }
//        .animation(.easeInOut)
//        .padding()
//        .padding(.top)
//        .background(Color(.white))
//        .cornerRadius(30, corners: [.topLeft, .topRight])
//        .offset(x: 0, y: -30.0)
//    }
//}
//
//
//struct BackButton: View {
//    let action: () -> Void
//    var body: some View {
//        Button(action: action) {
//            Image(systemName: "chevron.backward")
//                .foregroundColor(.black)
//                .padding(.all, 12)
//        }
//    }
//}
//
//struct InfoButton: View {
//    var body: some View {
//
//        NavigationLink(
//            destination: Text("hello"),
//            label: {
//
//                Image(systemName: "info.circle")
//                    .foregroundColor(.black)
//                    .padding(.all, 12)
//
//
//            })
//
//    }
//}

struct DetailScreen : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var opacity : Double = 0
    @Binding var isLiked: Bool
    @State var modalViewActive = false
    @State var offset = CGSize.zero
    @State var count = 0
    @State var start = false
    @State var to : CGFloat = 0

    var body: some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                            
            ZStack{
                
                VStack{
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack{
                            // first parallax scroll
                            
                            GeometryReader{reader in
                                
                                VStack{
                                    
                                    Image("bung")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY > 0 ?
                                                reader.frame(in: .global).minY + (UIScreen.main.bounds.height / 2.2) :
                                                reader.frame(in: .global).minY + UIScreen.main.bounds.height / 2.2)
                                        .offset(y: -reader.frame(in: .global).minY)
                                        .offset(x: 5)
                                        .onChange(of: reader.frame(in: .global).minY){value in
                                            
                                            let offset = value + (UIScreen.main.bounds.height / 5)
                                            
                                            if offset < 80 {
                                                
                                                if offset > 0{
                                                    
                                                    let opacity_value = (80 - offset) / 80
                                                    
                                                    self.opacity = Double(opacity_value)
                                                    
                                                    return
                                                }
                                                
                                                self.opacity = 1
                                            }
                                            
                                            else{
                                                
                                                self.opacity = 0
                                            }
                                        }
                                }
                            }

                            //
                            .frame(height: UIScreen.main.bounds.height / 2.2)
                            //
                            
                            VStack(alignment: .leading, spacing: 10){
                                
                                Text("DAY")
                                
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Intermediate")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                        Text("Level")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }

                                    Spacer()
                                    VStack(alignment: .leading){

                                        Text("13 Mins")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)

                                        Text("Time")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }

                                    Spacer()
                                    VStack(alignment: .leading){
                                        Text("100 Kcal")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)

                                        Text("Calorie")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                    }

                                }
                                .padding(.vertical, 20)

                                NavigationLink(
                                    destination: Text("Destination"),
                                    label: {
                                        Text("Sound & Music")
                                            .font(.system(size: 16))
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                    })
                                    .padding(.vertical, 20)

                                HStack(spacing: 5){
                                    Text("Exercises")
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Text("(16)")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                        .fontWeight(.semibold)

                                }
                                
                                Button(action: {
                                    withAnimation{
                                        modalViewActive.toggle()
                                    }
                                }, label: {
                                    HStack{
                                        LottieView4()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading){
                                            Text("JUMPING JACKS")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            Text("00:20")
                                                
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                                .padding(.vertical)
                                            Divider()
                                                .foregroundColor(.gray.opacity(0.1))
                                        }
                                        .offset(y: 15)
                                    }
                                    
                                })
                                .padding(.vertical, 5)
                                Button(action: {
                                    withAnimation{
                                        modalViewActive.toggle()
                                    }
                                }, label: {
                                    
                                    HStack{
                                        LottieView()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading){
                                            Text("JUMPING JACKS")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            Text("x 16")
                                                
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                                .padding(.vertical)
                                            Divider()
                                                .foregroundColor(.gray.opacity(0.1))
                                        }
                                        .offset(y: 15)
                                    }
                                })
                                .padding(.vertical, 5)
                                Button(action: {
                                    withAnimation{
                                        modalViewActive.toggle()
                                    }
                                }, label: {
                                    HStack{
                                        LottieView2()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading){
                                            Text("JUMPING JACKS")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            Text("x 20")
                                                
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                                .padding(.vertical)
                                            Divider()
                                                .foregroundColor(.gray.opacity(0.1))
                                        }
                                        .offset(y: 15)
                                    }
                                })
                                .padding(.vertical, 5)
                                
                                Button(action: {
                                    withAnimation{
                                        modalViewActive.toggle()
                                    }
                                }, label: {
                                    HStack{
                                        LottieView3()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading){
                                            Text("JUMPING JACKS")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            Text("x 20")
                                                
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                                .padding(.vertical)
                                            Divider()
                                                .foregroundColor(.gray.opacity(0.1))
                                        }
                                        .offset(y: 15)
                                    }
                                })
                                .padding(.vertical, 5)
                                
                                Button(action: {
                                    withAnimation{
                                        modalViewActive.toggle()
                                    }
                                }, label: {
                                    HStack{
                                        LottieView7()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading){
                                            Text("JUMPING JACKS")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            Text("x 20")
                                                
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                                .padding(.vertical)
                                            Divider()
                                                .foregroundColor(.gray.opacity(0.1))
                                        }
                                        .offset(y: 15)
                                    }
                                })
                                .padding(.vertical, 5)
                                
                                Button(action: {
                                    withAnimation{
                                        modalViewActive.toggle()
                                    }
                                }, label: {
                                    HStack{
                                        LottieView6()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                        VStack(alignment: .leading){
                                            Text("JUMPING JACKS")
                                                .fontWeight(.semibold)
                                                .foregroundColor(.black)
                                            Text("x 20")
                                                
                                                .font(.callout)
                                                .foregroundColor(.gray)
                                                .padding(.vertical)
                                            Divider()
                                                .foregroundColor(.gray.opacity(0.1))
                                        }
                                        .offset(y: 15)
                                    }
                                })
                                .padding(.vertical, 5)

                                
    //                            ForEach(albums, id: \.album_name){album in
    //
    //                                HStack(spacing: 10){
    //
    //                                    Image("\(album.album_cover)")
    //                                        .resizable()
    //                                        .aspectRatio(contentMode: .fill)
    //                                        .frame(width: 100, height: 100)
    //                                        .cornerRadius(10)
    //                                        .padding(.vertical, 5)
    //
    //                                    VStack(alignment: .leading, spacing: 5){
    //                                        Text("\(album.album_name)")
    //
    //                                        Text("\(album.album_author)")
    //                                            .font(.caption)
    //                                        Spacer()
    //                                        Divider()
    //                                            .frame(width: 260, height: 3)
    //                                            .foregroundColor(.gray)
    //                                    }
    //                                    Spacer(minLength: 0)
    //                                }
    //    //                            .padding(.horizontal)
    //                            }
//                                Text("You might also like")
//                                    .font(.system(size: 20))
//                                    .foregroundColor(.black)
//                                    .fontWeight(.bold)
//                                    .padding(.top)
                                
//                                ScrollView (.horizontal, showsIndicators: false) {
//                                    HStack (spacing: 0) {
//                                        ForEach(0 ..< 4) { i in
//                                            ProductCardView(size: 180)
//                                        }
//                                        .offset(x: -15)
//                                    }
//                                }
                            }
                            .ignoresSafeArea(.all)
                            .animation(.easeInOut)
                            .padding()
//                            .padding(.top)
                            .background(Color(.white))
                            .cornerRadius(20)
                            .offset(x: 0, y: -30.0)
                            
                        }
                    }
                    
                    HStack {
                        
                        NavigationLink(destination: StartButton(), label: {
                                
                            Text("START")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 50)
                                
                            
                      
                        })
                        .background(Color.blue)
                        .cornerRadius(40)
                        
                    }
                    .padding(.horizontal)
                }
                .blur(radius: modalViewActive ? 10 : 0)
                .scaleEffect(modalViewActive ? 0.95 : 1)
                if modalViewActive {
                    ZStack {
                        ModalView2(modalViewActive: $modalViewActive, width: UIScreen.main.bounds.width)
                    }
                    .animation(.easeInOut)
                    .transition(.move(edge: .bottom))
                    .offset(x: 0, y: offset.height > 0 ? offset.height : 0)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.offset.height = gesture.translation.height

                            }
                            .onEnded { _ in
                                if self.offset.height > UIScreen.main.bounds.width / 2 {
                                    withAnimation {
                                        modalViewActive.toggle()
                                    }
                                    self.offset = .zero
                                } else {
                                    self.offset = .zero
                                }
                            }
                    )
                }
            }
            
            
            // Header View...
            HStack{
                
                Button(action: {
                    
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack(spacing: 8){
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))

                    }
                }
                Spacer(minLength: 0)

                Text("")
                    .font(.system(size: 20))
                    .fontWeight(.bold)

                Spacer(minLength: 0)
                
                Button(action: {
                    
                    self.isLiked.toggle()
                    
                }) {

                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .black)
                        .aspectRatio(contentMode: .fill)
                        .font(.system(size: 20))
                }

            }
            .padding()
            .foregroundColor(opacity > 0.6 ? .black : .white)
            .padding(.top, 30)
//            .padding(.top,edges!.top)
            .background(Color.white.opacity(opacity))
            .shadow(color: Color.black.opacity(opacity > 0.8 ? 0.1 : 0), radius: 5, x: 0, y: 5)
            
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ProductCardView: View {
//    let image: Image
    let size: CGFloat
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ZStack{
                
                Image("tay")
                    .resizable()
                    .frame(width: size, height: 300 * (size/210))
                    .cornerRadius(10)
                VStack(alignment: .leading){
                    Text("CUSTOM WORKOUT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)

                    Text("SMART CREATOR")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                }
            }
        }
        .frame(width: size)
        .padding()
        
    }
}

struct ModalView2: View {
    @AppStorage("currentNumber") var currentNumber = 20
    @AppStorage("currentWater") var currentWater = 0
    @AppStorage("currentVideo") var currentVideo = 0

    
    @State var animationInProgress = false
    @Binding var modalViewActive: Bool
    @State private var playerSize: CGSize = .zero
    var width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.white)
                .ignoresSafeArea()
                .shadow(radius: 15)
                
            VStack {
                
                ScrollView(.vertical, showsIndicators: true){
                    
                    if currentVideo == 1 {
                        Video()
                    }
                    if currentVideo == 2 {
                        Video2()
                    }
                    if currentVideo == 3 {
                        Video3()
                    }
                    if currentVideo == 4 {
                        Video()
                    }
                    if currentVideo == 5 {
                        Video()
                    }


                }
                .padding(.horizontal, 10)
                
                HStack {
                    
                    HStack(spacing: 30){
                        
                        Button(action: {
                            if currentVideo > totalVideo {
                                currentVideo -= 1
                            }else {
                                currentVideo = 1
                            }
                        }) {
                            
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        }
                        Text("\(currentVideo)/16")
                        Button(action: {
                            if currentVideo <= totalVideo{
                                currentVideo += 1
                            }else{
                                currentVideo = 1
                            }
                        }) {
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                        }

                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeIn(duration: 0.3)) {
                            modalViewActive.toggle()
                        }
                    } label: {
                        Text("Close")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
//                            .padding(.vertical)
                            .frame(width: 200, height: 50)
                    }
                    .background(Color.blue)
                    .cornerRadius(40)
                    
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 20)
            }
//            .frame(height: width * 1.45)
            .frame(height: width * 1.8)
//                .padding(30)
//                Spacer()
        }
        .offset(y: 70)
    }
}
var totalVideo = 6
var totalNumber = 100


struct Video: View {
    @State private var playerSize: CGSize = .zero
    @AppStorage("currentNumber") var currentNumber = 20

    var body: some View{
        
        ZStack{
            
            PlayerView()
              .frame( // 算出された値でサイズ指定.
                  width: playerSize.width,
                  height: playerSize.height
              )

        }
        
        .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 20, x: 20, y: 20)
        .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 20, x: -20, y: -20)
        .cornerRadius(10)
        .onAppear {
            // windowサイズからplayerサイズを算出.
            let frame = UIApplication.shared.windows.first?.frame ?? .zero

            // 縦横比が16:9になるように高さを調整.
            playerSize = CGSize(
                width: 390,
                height: frame.width / 13 * 6.9
            )
        }
        .padding(.vertical)
        VStack(alignment: .leading){
            
            HStack{
                Text("JUMPING JACKS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                
            }
            .padding(.vertical)

            
            HStack{
                
                Text("Duration (Seconds)")
                    .foregroundColor(.black)
                Spacer()
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        if currentNumber <= totalNumber {
                            
                            currentNumber -= 1
                        }
                        else {
                            currentNumber = 1
                        }
                        
                    }) {
                        
                        Image(systemName: "minus")
                            .frame(width: 30, height: 30)
                            .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                             )

                    }
                    Text("\(currentNumber)")
                        .foregroundColor(.black)
                    
                    Button(action: {
                        
                        if currentNumber <= totalNumber {
                            currentNumber += 1
                        } else {
                            currentNumber = 20
                        }
                    }) {
                        
                        Image(systemName: "plus")
                            .frame(width: 30, height: 30)
                            .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                             )
                    }
                }
            }
            Text("Start with your feet together and your arms by your sider, then jump up with your feet apart and your hands overhead.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
            Text("Return to the start positon then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
        }
    }
}

struct Video2: View {
    @State private var playerSize: CGSize = .zero
    @AppStorage("currentNumber") var currentNumber = 20

    var body: some View{
        
        ZStack{
            
            PlayerView()
              .frame( // 算出された値でサイズ指定.
                  width: playerSize.width,
                  height: playerSize.height
              )

        }
        
        .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 20, x: 20, y: 20)
        .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 20, x: -20, y: -20)
        .cornerRadius(10)
        .onAppear {
            // windowサイズからplayerサイズを算出.
            let frame = UIApplication.shared.windows.first?.frame ?? .zero

            // 縦横比が16:9になるように高さを調整.
            playerSize = CGSize(
                width: 390,
                height: frame.width / 13 * 6.9
            )
        }
        .padding(.vertical)
        VStack(alignment: .leading){
            
            HStack{
                Text("SIT-UPS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                
            }
            .padding(.vertical)

            
            HStack{
                
                Text("Duration (Seconds)")
                    .foregroundColor(.black)
                Spacer()
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        if currentNumber <= totalNumber {
                            
                            currentNumber -= 1
                        }
                        else {
                            currentNumber = 1
                        }
                        
                    }) {
                        
                        Image(systemName: "minus")
                            .frame(width: 30, height: 30)
                            .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                             )

                    }
                    Text("\(currentNumber)")
                        .foregroundColor(.black)
                    
                    Button(action: {
                        
                        if currentNumber <= totalNumber {
                            currentNumber += 1
                        } else {
                            currentNumber = 20
                        }
                    }) {
                        
                        Image(systemName: "plus")
                            .frame(width: 30, height: 30)
                            .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                             )
                    }
                }
            }
            Text("Start with your feet together and your arms by your sider, then jump up with your feet apart and your hands overhead.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
            Text("Return to the start positon then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
        }
    }
}

struct Video3: View {
    @State private var playerSize: CGSize = .zero
    @AppStorage("currentNumber") var currentNumber = 20

    var body: some View{
        
        ZStack{
            
            PlayerView()
              .frame( // 算出された値でサイズ指定.
                  width: playerSize.width,
                  height: playerSize.height
              )

        }
        
        .shadow(color: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)), radius: 20, x: 20, y: 20)
        .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)), radius: 20, x: -20, y: -20)
        .cornerRadius(10)
        .onAppear {
            // windowサイズからplayerサイズを算出.
            let frame = UIApplication.shared.windows.first?.frame ?? .zero

            // 縦横比が16:9になるように高さを調整.
            playerSize = CGSize(
                width: 390,
                height: frame.width / 13 * 6.9
            )
        }
        .padding(.vertical)
        VStack(alignment: .leading){
            
            HStack{
                Text("BBB")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                
            }
            .padding(.vertical)

            
            HStack{
                
                Text("Duration (Seconds)")
                    .foregroundColor(.black)
                Spacer()
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        if currentNumber <= totalNumber {
                            
                            currentNumber -= 1
                        }
                        else {
                            currentNumber = 1
                        }
                        
                    }) {
                        
                        Image(systemName: "minus")
                            .frame(width: 30, height: 30)
                            .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                             )

                    }
                    Text("\(currentNumber)")
                        .foregroundColor(.black)
                    
                    Button(action: {
                        
                        if currentNumber <= totalNumber {
                            currentNumber += 1
                        } else {
                            currentNumber = 20
                        }
                    }) {
                        
                        Image(systemName: "plus")
                            .frame(width: 30, height: 30)
                            .overlay(
                                 RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                             )
                    }
                }
            }
            Text("Start with your feet together and your arms by your sider, then jump up with your feet apart and your hands overhead.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
            Text("Return to the start positon then do the next rep. This exercise provides a full-body workout and works all your large muscle groups.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
        }
    }
}





//data
struct Album {
    var album_name : String
    var album_author : String
    var album_cover : String
}

var albums = [

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),
    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),
    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),
    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),

    Album(album_name: "workout", album_author: "20 s", album_cover: "tay"),


]
