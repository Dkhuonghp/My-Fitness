//
//  GraphView.swift
//  MapView
//
//  Created by NGUYEN DUY KHUONG on 2021/07/07.
//

import SwiftUI
//import SwiftUICharts

struct GraphView: View {
    @State var startAnimation = false
    var body: some View{

        ZStack{

            GraphBackGroundView()

            LineGraph(data: date.caloryData)
                .trim(from: 0.0, to: startAnimation ? 1.0 : 0.0)
                .stroke(Color.green, lineWidth: 4.0)
                .frame(height: 200)
                .offset(x: 20,y: -20)
        }
        //khi start thi animation chay tu trai qua phai xuat hien
        .onAppear{
            withAnimation(.easeIn(duration: 1.5)) {
                startAnimation.toggle()
            }
        }
    }
}

struct GraphBackGroundView: View {
    var body: some View {
        
        HStack {
            ZStack(alignment: .top){

                VStack(spacing: 40){

                    HStack{

                        Spacer()

                        Text("")

                    }
                    ForEach(0..<5, id: \.self) { i in
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(height: 1)
                    }
                    HStack{

                        ForEach(date.weekArray, id: \.self) { day in
                            Text(day)
                                .foregroundColor(.black)
                                .offset(x: 20)
                            Spacer()
                        }
                    }
                    .offset(y: -28)
                }
                HStack{

                    VStack(alignment: .leading, spacing: 22) {
                        Text(" ")
                        ForEach(Array(stride(from: 4, through: 0, by: -1)), id: \.self) { i in
                            Text("\(i * 10)")
                                .font(.system(size: 15, weight: .regular))
                                .foregroundColor(.black)
                        }
                    }
                    .offset(y: -8)
                    Spacer()
                }
            }
            .padding(.horizontal, 10)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
        .padding(.top, 2.5)
        .padding(.bottom, 2.5)
    }
}

struct LineGraph: Shape {

    var data: [CGFloat]

    func path(in rect: CGRect) -> Path {

        var path = Path()

        if data.count == 0 {
            return path
        }

        var x: CGFloat = 30
        var y: CGFloat = 200 - data[0]/2
        path.move(to: CGPoint(x: x, y: y))
        var previousPoint = CGPoint(x: x, y: y)

        x += 40

        for i in 1..<data.count {
            y = 200 - data[i]/2

            let currentPoint = CGPoint(x: x, y: y)
            let minusOffsetPoint = CGPoint(x: currentPoint.x - 20, y: currentPoint.y)
            let plusOffsetPoint = CGPoint(x: previousPoint.x + 20, y: previousPoint.y)

            path.addCurve(to: currentPoint, control1: plusOffsetPoint, control2: minusOffsetPoint)

            previousPoint = CGPoint(x: x, y: y)

            x += 40
        }
        return path
    }
}
struct date {
    static let caloryData: [CGFloat] = [30, 50, 120, 290, 200, 140, 220, 210, 305 ]
    static let weekArray = ["S","M","T","W","T","F","S"]
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}

