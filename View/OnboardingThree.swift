//
//  OnboardingThree.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/26.
//

import SwiftUI

struct OnboardingThree: View {
    var body: some View {
        VStack {
             VStack {
                 Image("tay 2")
                 
                 Text("Create Groups")
                     .font(.system(size: 25, weight: .bold, design: .rounded))
                     .padding(.bottom, 20)
                 Text("You can create a group or multiple groups to store the shortcuts your create. Groups help keep your shorcuts organized.")
                     .font(.system(size: 17, weight: .medium, design: .rounded))
                     .multilineTextAlignment(.center)
                     .padding(.horizontal, 20)
                     .padding(.bottom, 30)
             }
         }
        
    }
}

struct OnboardingThree_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingThree()
    }
}
