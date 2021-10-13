//
//  Graph.swift
//  MapView
//
//  Created by NGUYEN DUY KHUONG on 2021/07/07.
//

import SwiftUI
//import Lottie

struct LevelTest: View {
    @State var animationInProgress = false
    @AppStorage("currentWater") var currentWater = 0
    @AppStorage("currentStep") var currentStep = 2500
    @AppStorage("currentPage") var currentPage = 0

    @State var drawProgress = 1/999
    @State var totalTime = Text("0:00")
    @State var untapped = Text("Start")
    @State var ringring = false
    @State private var birthdate = Date()
    @State private var date = Date()
    @State var percent: CGFloat = 0
    @State var pickerSelectedItem = 0
    @State var GraphView = 1

    @State var dataPoints: [[CGFloat]] = [
        [25, 32, 43, 15, 20, 25, 22],
        [5, 12, 25, 11, 5, 30, 20],
        [30, 5, 12, 23, 20, 10, 25]
    ]

    var body: some View {
        
        ZStack{
            
            GeometryReader{_ in
                
                ScrollView(showsIndicators: false) {
                    
                    VStack{

                        HStack{

                            Picker(selection: $pickerSelectedItem, label: Text("")) {

                                Text("Weekday").tag(0)

                            }
                            Picker(selection: $pickerSelectedItem, label: Text("")) {

                                Text("Afternoon").tag(1)

                            }
                            Picker(selection: $pickerSelectedItem, label: Text("")) {

                                Text("Evening").tag(2)

                            }

                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                        .padding(.vertical)
                        .pickerStyle(SegmentedPickerStyle())
                        
                        //Calo
                        VStack{

                            HStack{
                                
                                VStack {
                                    
                                    HStack{
                                            
                                        Image(systemName:"flame.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.orange)
                                        Text("Calories")
                                            .foregroundColor(.black)
                                            .bold()
                                    }
                                }
                                Spacer()
                                VStack(alignment: .trailing){
                                    
                                    Text("Week Average")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)

                                    Text("0 Kcal")
                                        .foregroundColor(.black)
                                        .padding(.top, 5)

                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                            
                            HStack(spacing: 45){
                                    
                                BarChart(value: dataPoints[pickerSelectedItem][0])
                                BarChart(value: dataPoints[pickerSelectedItem][1])
                                BarChart(value: dataPoints[pickerSelectedItem][2])
                                BarChart(value: dataPoints[pickerSelectedItem][3])
                                BarChart(value: dataPoints[pickerSelectedItem][4])
                                BarChart(value: dataPoints[pickerSelectedItem][5])
                                BarChart(value: dataPoints[pickerSelectedItem][6])
                                
                            }
                            .animation(.default)
                            .foregroundColor(.gray)
                            .padding(.bottom)
//                            HStack{
//                                ForEach(date.weekArray, id: \.self) { day in
//                                    Text(day)
//                                        .font(.caption)
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.black)
//                                        .offset(x: 21)
//                                    Spacer()
//                                }
//                            }.padding(.bottom, 10)
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                        .padding(.top, 2.5)
                        .padding(.bottom, 2.5)
                        
                        
                        
                        //Bai tap
                        VStack{

                            HStack{
                                
                                HStack{
                                        
                                        Image(systemName:"deskclock.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(.green)
                                        Text("Workout")
                                            .foregroundColor(.black)
                                            .bold()
                                }
                                Spacer()
                                VStack(alignment: .trailing){
                                    
                                    Text("Week Average")
                                        .font(.system(size: 15))
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    Text("0 min")
                                        .foregroundColor(.black)
                                        .padding(.top,5)
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                            
                            HStack(spacing: 45){
                                    
                                BarChart(value: dataPoints[pickerSelectedItem][0])
                                BarChart(value: dataPoints[pickerSelectedItem][1])
                                BarChart(value: dataPoints[pickerSelectedItem][2])
                                BarChart(value: dataPoints[pickerSelectedItem][3])
                                BarChart(value: dataPoints[pickerSelectedItem][4])
                                BarChart(value: dataPoints[pickerSelectedItem][5])
                                BarChart(value: dataPoints[pickerSelectedItem][6])
                                
                            }
                            .animation(.default)
                            .foregroundColor(.gray)
                            .padding(.bottom)
//                            HStack{
//                                Spacer()
//                                ForEach(Data.weekArray, id: \.self) { day in
//                                    Text(day)
//                                        .font(.caption)
//                                        .fontWeight(.bold)
//                                        .foregroundColor(.black)
////                                        .offset(x: 21)
//                                    Spacer()
//                                }
//                            }.padding(.bottom, 10)
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                        .padding(.top, 2.5)
                        .padding(.bottom, 2.5)
                        
                        //theo doi uong nuoc
                        VStack(alignment: .center){
                            NavigationLink(
                                destination: WaterDetailsView(),
                                label: {
                                    
                                    HStack{
                                        
                                        VStack(alignment: .leading) {
                                            
                                            HStack{
                                                    
                                                    Image(systemName: "drop.fill")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.blue.opacity(0.9))
                                                    Text("Water Tracker")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15))
                                                        .fontWeight(.bold)
                                            }
                                            HStack{
                                                
                                                HStack(alignment: .center){
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
                                        Spacer()

                                        ZStack{
                                            
                                            Circle()

                                                .stroke(Color.gray,lineWidth: 5)
                                                .frame(width: 60, height: 60)
                                            Circle()
                                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))

                                                .stroke(RadialGradient(
                                                            gradient: Gradient(colors: [Color.blue, Color.white.opacity(0.3)]),
                                                            center: .center,
                                                            startRadius: 80,
                                                            endRadius: 200),
                                                        lineWidth: 5)
                                                .rotationEffect(.degrees(-90))
                                                .frame(width: 60, height: 60)
                                            Image(systemName: "drop.fill")
                                                .font(.system(size: 20))
                                                .foregroundColor(.blue.opacity(0.9))

                                        }
                                        .animation(.default)
        //                                    .padding(.horizontal, 10)

                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.top, 20)
                                    .padding(.bottom, 10)
                                })

                            Button(action: {
                                if currentPage <= totalPages{
                                    currentPage += 1
                                }
                                else{
                                    currentPage = 1
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
             
                        //theo dõi bước chân
                        
                        VStack{
                            NavigationLink(
                                destination: StepDetailView(),
                                label: {
                                    
                                    HStack{
                                        
                                        VStack(alignment: .leading) {
                                            
                                            HStack{
                                                    
                                                    Image("steps")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.orange.opacity(0.9))
                                                    Text("Step Tracker")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15))
                                                        .fontWeight(.bold)
                                            }
                                            HStack{
                                                
                                                HStack(alignment: .center){
                                                    Text("0")
                                                        .font(.system(size: 24))
                                                        .foregroundColor(.black)
                                                        .bold()
                                                    Text("/\(currentStep) Steps")
                                                        .font(.system(size: 15))
                                                        .foregroundColor(.gray)
                                                        .bold()
                                                        .offset(y: 3)

                                                }
                                            }
                                            
                                        }
                                        Spacer()

                                        ZStack{

                                            Circle()
                                                .stroke(RadialGradient(
                                                            gradient: Gradient(colors: [Color.black.opacity(0.3), Color.white.opacity(0.3)]),
                                                            center: .center,
                                                            startRadius: 80,
                                                            endRadius: 200),
                                                        lineWidth: 5)
                                                .frame(width: 60, height: 60)
                                            Image("steps")
                                                .font(.system(size: 20))
                                                .foregroundColor(.blue.opacity(0.9))

                                        }
        //                                    .padding(.horizontal, 10)

                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.top, 30)
                                    .padding(.bottom, 30)
                                })

                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                        .padding(.top, 2.5)
                        .padding(.bottom, 2.5)
                        .padding(.vertical)
                        
//                        VStack{
//
//                            Text("\(Int(percent))%")
//                                .font(.system(size: 20, weight: .bold))
//
//                            ProgressBar(width: 300, height: 30, percent: percent, color1:  Color(.blue), color2: Color(.green))
//                                .animation(.linear)
//
//                            Button(action: { percent = CGFloat.random(in: 0...50) }, label: {
//                                Text("Button")
//                            })
//
//                        }
//
//                        VStack{
//
//                            DatePicker(
//                                "Start Date",
//                                selection: $date,
//                                displayedComponents: [.date]
//                            )
//
//
//                        }
//
//                        ZStack{
//
//                            Circle()
//                                .stroke(lineWidth: 4)
//                                .frame(width: 200, height: 200)
//                                .foregroundColor(Color(.systemGray))
//
//            //                actiive ring
//                            Circle()
//                                .trim(from: 0.0, to: CGFloat(drawProgress))
//                                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
//                                .frame(width: 200, height: 200)
//                                .foregroundColor(Color(.systemBlue))
//                                .rotationEffect(.degrees(-90))
//                                .animation(Animation.easeInOut(duration: 180).delay(0.1).repeatForever(autoreverses: false))
//
//                            VStack(spacing: 20){
//
//                                Text(Date().addingTimeInterval(600), style: .date)
//
//                                HStack{
//                                    Image(systemName: "clock")
//                                        .font(.title)
//
//                                    totalTime
//                                        .font(.title)
//                                }
//                                Text("goal: 10000")
//                            }
//                        }
//
//                        HStack{
//
//                            RoundedRectangle(cornerRadius: 23)
//                                .frame(width: 150, height: 46)
//                                .foregroundColor(Color(.systemBlue))
//                                .overlay(untapped)
//                                .onTapGesture {
//                                    totalTime = Text(Date().addingTimeInterval(0.0), style: .timer)
//                                    drawProgress = 1
//                                    untapped = Text("Stop")
//                                }
//                        }
//                        .padding(.vertical)
                    }
                    .padding(.horizontal)
                    
                    
                
        //            if animationInProgress {
        //                LottieView(animationInProgress: $animationInProgress)
        //                    .frame(width: 100, height: 100)
        //            }
                    
                }
            }
        }
        .navigationBarTitle("") //this must be empty
        .navigationBarHidden(true)
    }
}

struct BarChart: View {
    var value: CGFloat
    
    var body: some View{
        
        VStack{
            
            ZStack(alignment: .bottom){
                Capsule()
                    .frame(width: 10, height: 50)
                    .foregroundColor(Color.gray.opacity(0.2))
                Capsule()
                    .frame(width: 10, height: value)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct LevelTest_Previews: PreviewProvider {
    static var previews: some View {
        LevelTest()
    }
}
var totalPages = 60
var totalCups = 60

struct ProgressBar: View {
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    var color1 = Color(.orange)
    var color2 = Color(.red)
    var body: some View{
        
        let multiplier = width / 100
        ZStack(alignment: .leading){
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.black.opacity(0.1))
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                                .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
                ).foregroundColor(.clear)
                
        }
    }
}

