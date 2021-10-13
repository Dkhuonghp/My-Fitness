//
//  InfoDashboardView.swift
//  MapView
//
//  Created by NGUYEN DUY KHUONG on 2021/07/06.
//

import SwiftUI

struct InfoDashboardView: View {
    @EnvironmentObject var manager: StepCountManager
    @State private var isActive: Bool = false
    @State private var showLink = false
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                DataItemView(dataItem: manager.statData[0])
                
    //            Spacer()
    //
    //            Rectangle()
    //                .fill(Color.white)
    //                .frame(width: 1, height: 100)
    //                .opacity(0.2)
    //
                Spacer()
                
                DataItemView(dataItem: manager.statData[1])
                
    //            Spacer()
    //
    //            Rectangle()
    //                .fill(Color.white)
    //                .frame(width: 1, height: 100)
    //                .opacity(0.2)
    //
                Spacer()
                
                DataItemView(dataItem: manager.statData[2])
                
                Spacer()
                
                DataItemView(dataItem: manager.statData[3])

            }

//            HStack {
//
//                DataItemView(dataItem: manager.statData[4])
//
//    //            Spacer()
//    //
//    //            Rectangle()
//    //                .fill(Color.white)
//    //                .frame(width: 1, height: 100)
//    //                .opacity(0.2)
//    //
//                Spacer()
//
//                DataItemView(dataItem: manager.statData[1])
//
//    //            Spacer()
//    //
//    //            Rectangle()
//    //                .fill(Color.white)
//    //                .frame(width: 1, height: 100)
//    //                .opacity(0.2)
//    //
//                Spacer()
//
//                DataItemView(dataItem: manager.statData[2])
//
//                Spacer()
//
//                DataItemView(dataItem: manager.statData[3])
//
//            }
            
//            Navigation()
        }
        .padding()
    }
}

struct DataItemView: View {
    let dataItem: DataItem
    var body: some View {
        VStack {
            Image(systemName: dataItem.imageName)
                .foregroundColor(dataItem.imageColor)
                .font(.system(size: 28))
//                .shadow(color: dataItem.imageColor.opacity(0.5), radius: 10, x: 4, y: 24)
                .padding(.top, 5)
            HStack(spacing: 10){
                
                Text(dataItem.value)
                    .font(.system(size: 16, design: .monospaced))
                    .fixedSize()
                    .frame(width: 10)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                
                Text(dataItem.unit)
                    .font(.system(size: 12))
            }
            

        }
        .foregroundColor(.black)
    }
}

