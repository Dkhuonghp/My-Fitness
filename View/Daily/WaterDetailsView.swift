//
//  WaterDetailsView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/19.
//

import SwiftUI
var totalWater = 20

struct WaterDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var modalViewActive = false
    @State var offset = CGSize.zero
    @State var animationInProgress = false
    @AppStorage("currentWater") var currentWater = 0
    @AppStorage("currentPage") var currentPage = 0
    @AppStorage("currentCup") var currentCup = 0
    @State private var date = Date()

    

    var body: some View {
        
        HStack{
            
            GeometryReader { bounds in
                
                    ZStack {
                        
                        VStack {
                            
                            HStack {
                                
                                Button(action: {
                                    
                                    presentationMode.wrappedValue.dismiss()

                                    
                                }){
                                    Image(systemName: "chevron.left")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                }
                                
                                Spacer()
                                
                                Text("WATER TRACKER")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                Spacer()

                                Button {
                                    withAnimation {
                                        modalViewActive.toggle()
                                    }
                                    
                                } label: {
                                    Image(systemName: "slider.horizontal.3")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal)
                            
                            ScrollView{
                                
                                VStack {
                                    
                                    
                                    VStack(alignment: .center){
                                        
                                        VStack{
                                            
                                            HStack{
                                                Text("Today")
                                                    .font(.system(size: 24))
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                                Spacer()
                                            }
                                            

                                            ZStack{
                                                
                                                Circle()

                                                    .stroke(Color.gray,lineWidth: 15)
                                                    .frame(width: 150, height: 150)
                                                Circle()
                                                    .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))

                                                    .stroke(LinearGradient(
                                                            gradient: Gradient(
                                                                colors: [Color.blue]),
                                                            startPoint: .top,
                                                            endPoint: .trailing),
                                                        style: StrokeStyle(
                                                            lineWidth: 15,
                                                            lineCap: .round))
                                                    .rotationEffect(.degrees(-90))
                                                    .frame(width: 150, height: 150)
                                              
                                                VStack{
                                                    Image(systemName: "drop.fill")
                                                        .font(.system(size: 25))
                                                        .foregroundColor(.blue.opacity(0.9))
                                                        .offset(y: -10)
                                                    VStack(alignment: .center){
                                                        Text("\(currentPage)")
                                                            .font(.system(size: 24))
                                                            .foregroundColor(.black)
                                                            .bold()
                                                        Text("/\(currentWater) Cups")
                                                            .font(.system(size: 15))
                                                            .foregroundColor(.gray)
                                                            .bold()
                                                            .offset(y: 3)

                                                    }
                                                    .animation(.default)
                                                }

                                            }
                                            .animation(.default)
                        //                                    .padding(.horizontal, 10)

                                        }
                                        .padding(.horizontal, 10)
                                        .padding(.top, 20)
                                        .padding(.bottom, 10)
                                            

                                        Button(action: {
                                            if currentPage <= totalPages{
                                                currentPage += 1
                                                
                                            }
                                            else{
                                                currentPage = 0
                                            }
                                            animationInProgress.toggle()

                                        }){

                                        Text("DRINK")
                                            .font(.system(size: 15))
                                            .bold()
                                            .foregroundColor(.white)
                                            .frame(width: 200, height: 45)
                                            .background(Color.blue)
                                            .cornerRadius(50)
                                            .padding(.bottom, 20)
                                        }

                                    }
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                    .padding(.top, 2.5)
                                    .padding(.bottom, 2.5)
                                    
                                    Section(header: HStack {
                                        Text("July 2021")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Spacer()
                                    }) {
                                        
                                        VStack{

                                            HStack{
                                                
                                                VStack(alignment: .leading){
                                                        
                                                    DatePicker(
                                                        "Start Date",
                                                        selection: $date,
                                                        displayedComponents: [.date]
                                                    )
                                                    .labelsHidden()
                                                }
                                                Spacer()
                                                VStack(alignment: .trailing){
                                                    
                                                    Text("\(currentPage)")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 25))
                                                        .fontWeight(.bold)
                                                    Text("Average (Cups)")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 15))
                                                        .fontWeight(.bold)

                                                }
                                            }
                                            .padding(.horizontal, 10)
                                            .padding(.top, 10)
                                            .padding(.bottom, 30)
                                            
                                            
                                            HStack(spacing: 40){
                                                
                                                ForEach(1...6, id: \.self){ i in
                                                    
                                                    VStack {
                                                        Text("\(currentPage)")
                                                            .foregroundColor(.black)
                                                            .fontWeight(.bold)
                                                        
                                                        ZStack(alignment: .bottom){
                                                            Capsule()
                                                                .frame(width:15, height: CGFloat(totalPages))
                                                            
                                                            Capsule()
                                                                .frame(width: 15, height: CGFloat(currentPage))
                                                                .foregroundColor(.blue)
                                                        }
                                                        .animation(.default)
                                                    }
                                                }
                                                
                                                VStack {
                                                    Text("\(currentPage)")
                                                        .foregroundColor(.black)
                                                        .fontWeight(.bold)
                                                    
                                                    ZStack(alignment: .bottom){
                                                        Capsule()
                                                            .frame(width:15, height: CGFloat(totalPages))
                                                        
                                                        Capsule()
                                                            .frame(width: 15, height: CGFloat(currentPage))
                                                            .foregroundColor(.blue)
                                                    }
                                                    .animation(.default)
                                                }
                                            }
                                            .animation(.default)
                                            .foregroundColor(.gray)
                                            .padding(.bottom, 10)
//                                            HStack{
//
//                                                ForEach(Data.weekArray, id: \.self) { day in
//                                                    Text(day)
//                                                        .font(.system(size: 15))
//                                                        .fontWeight(.bold)
//                                                        .foregroundColor(.black)
//                                                        .offset(x: 20)
//                                                    Spacer()
//                                                }
//                                            }.padding(.bottom, 10)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                                        .padding(.top, 2.5)
                                        .padding(.bottom, 2.5)
                                    }
                                }
                                .offset(y: 50)
                                .padding(.horizontal)
                            }
                        }
                        .blur(radius: modalViewActive ? 10 : 0)
                        .scaleEffect(modalViewActive ? 0.95 : 1)
                        
                        // Modal View...
                        if modalViewActive {
                            ZStack {
                                ModalView1(modalViewActive: $modalViewActive, width: bounds.size.width)
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
                                        if self.offset.height > bounds.size.height / 2 {
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
                }
            

        }
        .navigationBarHidden(true)
        
    }
}

struct WaterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WaterDetailsView()
            .environment(\.colorScheme, .dark)
    }
}

struct ModalView1: View {
    @AppStorage("currentWater") var currentWater = 0
    @State var animationInProgress = false
    @Binding var modalViewActive: Bool
    var width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(.white)
                .ignoresSafeArea()
//                .opacity(0.6)
                .shadow(radius: 15)
            VStack {
                
                VStack {
                    
                    HStack{
                        
                        Text("SET YOUR DAILY GOAL")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.horizontal)
                    Spacer()

                    VStack {
        
                        ZStack {
        
                            HStack{
        
                                Button(action: {
                                    if currentWater <= totalWater{
                                        currentWater -= 1
                                    }
        
                                    else{
                                        currentWater = 1
                                    }
                                    animationInProgress.toggle()
        
                                }){
        
                                    Image(systemName: "minus")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 35, height: 35)
                                        .background(Color.blue)
                                        .cornerRadius(10)
        
                                }
                                
                                Spacer()
        
                                ZStack{
        
                                    Circle()
                                        .stroke(Color.gray,lineWidth: 20)
                                    Circle()
                                        .trim(from: 0, to: CGFloat(currentWater) / CGFloat(totalWater))
                                        .stroke(LinearGradient(
                                                    gradient: Gradient(
                                                        colors: [Color.blue]),
                                                    startPoint: .top,
                                                    endPoint: .trailing),
                                                style: StrokeStyle(
                                                    lineWidth: 20,
                                                    lineCap: .round))
                                        .rotationEffect(.degrees (-90))
                                    
                                    VStack{
                                        
                                        Text("\(currentWater)")
                                            .font(.system(size: 40))
                                            .foregroundColor(.black)
                                            .fontWeight(.bold)
                                        Text("Cups")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                    }
                                }
                                .frame(width: 200, height: 200)
                                
                                Spacer()
                                Button(action: {
                                    if currentWater <= totalWater{
                                        currentWater += 1
                                    }
                                    else{
                                        currentWater = 1
                                    }
                                    animationInProgress.toggle()
        
                                }){
        
                                Image(systemName: "plus")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .frame(width: 35, height: 35)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        HStack(alignment: .center){
                            
                            Text("Most people need 8 cups (~2000 ml) a day.")
                                .font(.system(size: 19))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: UIScreen.main.bounds.width - 80)
                                                            
                        }
                        .offset(y: 30)
                    }

                    Spacer()
                    
                    VStack {
                        Button {
                            withAnimation(.easeIn(duration: 0.3)) {
                                modalViewActive.toggle()
                            }
                        } label: {
                            Text("Done")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color.blue)
                        .cornerRadius(40)
                        .padding(.top, 25)
                        
                    }
                    .padding(.vertical, 20)
                }
                .frame(height: width * 1.45)
//                .padding(30)
//                Spacer()
            }
        }
        .offset(y: 70)
    }
}
