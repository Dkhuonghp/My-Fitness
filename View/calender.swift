//
//  calender.swift
//  Plant Activity Tracker
//
//  Created by NGUYEN DUY KHUONG on 2021/07/12.
//

import SwiftUI

struct calender: View {
    @State var isActive: Bool = false
    @Binding var rootIsActive: Bool
    
    var body: some View {

        VStack(alignment: .leading) {
            
            ZStack{
                
                Image("strong")
                    .resizable()
                    .frame(width: 550,alignment: .center)
                    .ignoresSafeArea()
                

                ScrollView{
                    
                    VStack {
                        
                        HStack{
                                
                              ForEach(1...6, id: \.self){ i in
                                NavigationLink(
                                    destination: LevelUp(rootIsActive: self.$isActive),
                                    label: {
                                        
                                        Text("\(i)")
                                              .font(.system(size: 20))
                                              .fontWeight(.semibold)
                                              .foregroundColor(.white)
                                        
                                    })

                              }
                              .frame(width: 60, height: 60)
                              .background(Color.black.opacity(0.8))
                              .clipShape(Circle())
                              .padding(.bottom, 10)
                        }
                        HStack{
                                
                              ForEach(7...12, id: \.self){ i in
                                NavigationLink(
                                    destination: LevelUp(rootIsActive: self.$isActive),
                                    label: {
                                        
                                        Text("\(i)")
                                              .font(.system(size: 20))
                                              .fontWeight(.semibold)
                                              .foregroundColor(.white)
                                        
                                    })

                              }
                              .frame(width: 60, height: 60)
                              .background(Color.black.opacity(0.8))
                              .clipShape(Circle())
                              .padding(.bottom, 10)

                        }
                        HStack{
                                
                              ForEach(13...18, id: \.self){ i in
                                NavigationLink(
                                    destination: LevelUp(rootIsActive: self.$isActive),
                                    label: {
                                        
                                        Text("\(i)")
                                              .font(.system(size: 20))
                                              .fontWeight(.semibold)
                                              .foregroundColor(.white)
                                        
                                    })

                              }
                              .frame(width: 60, height: 60)
                              .background(Color.black.opacity(0.8))
                              .clipShape(Circle())
                              .padding(.bottom, 10)

                        }
                        HStack{
                                
                              ForEach(19...24, id: \.self){ i in
                                NavigationLink(
                                    destination: LevelUp(rootIsActive: self.$isActive),
                                    label: {
                                        
                                        Text("\(i)")
                                              .font(.system(size: 20))
                                              .fontWeight(.semibold)
                                              .foregroundColor(.white)
                                        
                                    })

                              }
                              .frame(width: 60, height: 60)
                              .background(Color.black.opacity(0.8))
                              .clipShape(Circle())
                              .padding(.bottom, 10)

                        }
                        HStack{
                                
                              ForEach(25...30, id: \.self){ i in
                                NavigationLink(
                                    destination: LevelUp(rootIsActive: self.$isActive),
                                    label: {
                                        
                                        Text("\(i)")
                                              .font(.system(size: 20))
                                              .fontWeight(.semibold)
                                              .foregroundColor(.white)
                                        
                                    })

                              }
                              .frame(width: 60, height: 60)
                              .background(Color.black.opacity(0.8))
                              .clipShape(Circle())
                              .padding(.bottom, 10)

                        }
                    }
                }
            }
        }

    }
}

