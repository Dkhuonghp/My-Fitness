//
//  StartWorkout.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/08/03.
//

import SwiftUI
import Lottie

struct StartWorkout: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var playerSize: CGSize = .zero
    @State var currentLottie = 1
    @State private var isShowingSheet = false
    @State var showFilter = false

    
    var body: some View {

        VStack{
            
            // Header View ...
            HStack{
                
                HStack{
                    
                    Button(action: {
                                       
                           presentationMode.wrappedValue.dismiss()

                       }, label: {
                           
                           Image(systemName: "chevron.left")
                               .foregroundColor(.black)
                       })
                }
               
                Spacer()
                
                VStack(alignment: .trailing){
                    
                    HStack{
                                    
                        Text("Exercises")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text("\(currentLottie)/6")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
            VStack{
                
                if currentLottie == 1 {
                    
                    Lottie4()
                }
                if currentLottie == 2{
                    Lottie2()
                }
                if currentLottie == 3{
                    Lottie()
                }
                if currentLottie == 4{
                    Lottie3()
                }
//                if currentLottie == 5{
//                    Lottie5()
//                }
                if currentLottie == 5{
                    Lottie6()
                }
                if currentLottie == 6{
                    Lottie7()
                }

                Spacer()
            }
            HStack{
                HStack{
                    Button(action: {
                        withAnimation(.easeInOut) {
                            
                            if currentLottie >= totalLottie{
                                currentLottie -= 1
                            }else{
                                currentLottie -= 1
                            }
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: 25,weight: .bold))
                            .foregroundColor(.black)
                    })
                }

                
                
                Spacer()

                Button(action: {
                    withAnimation(.easeInOut){
                        if currentLottie < totalLottie{
                            currentLottie += 1
                        }else{
                            currentLottie = 1
                        }
                    }


                }, label: {
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 25,weight: .bold))
                        .foregroundColor(.black)
                        
                })
                

            }
            .padding(.horizontal, 50)
            .offset(y: -120)

//            Button(action: {
//                isShowingSheet.toggle()
//            }) {
//
//                Image(systemName: "music.note.house.fill")
//                    .foregroundColor(.black)
//
//            }
//            .sheet(isPresented: $isShowingSheet,
//                   onDismiss: didDismiss) {
//                VStack {
//                    MusicPlayer()
//                    Button("Dismiss",
//                           action: { isShowingSheet.toggle() })
//                }
//            }
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    func didDismiss() {
        // Handle the dismissing action.
    }

}

var totalLottie = 6

struct StartWorkout_Previews: PreviewProvider {
    static var previews: some View {
        StartWorkout()
    }
}
