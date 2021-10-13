//
//  TabBar.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/19.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        
        
        VStack {
            
            HStack{
                VStack{
                    Text("Workout")
                    Text("3")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 2)
                }
                Spacer()
                VStack{
                    Text("Kcal")
                    Text("13")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 2)

                }
                Spacer()
                VStack{
                    Text("Time (min)")
                    Text("0")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.top, 2)

                }
            }
            .padding(.vertical)
            .padding(.horizontal)
//            .background(
//                RoundedRectangle(cornerRadius: 15)
//                    .foregroundColor(.white)
//                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
//            )
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
            .frame(height: 120)
        }
        .padding(.horizontal)
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
