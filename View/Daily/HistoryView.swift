//
//  HistoryView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/21.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        
        VStack{
            
            HStack(alignment: .top){
                
                Text("History")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer()
                
                Button(action: {}, label: {
                    Text("View all")
                })

            }
            Divider()
                .frame(width: 350, height: 1)
                .foregroundColor(.gray)
            Spacer()

            
        }
        
        .padding(.horizontal)
        .padding(.bottom, 20)
        .background(

            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
        )
        .padding(.horizontal)

        .frame(height: 250)

//        .padding()


    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
