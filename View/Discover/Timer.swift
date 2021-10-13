//
//  Timer.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/08/03.
//

import SwiftUI
import UserNotifications

struct timer : View {
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{

        VStack{
            
            HStack{
                Text("00 : \(self.count)")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
            }
                            
            ZStack{
                
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.gray.opacity(0.1), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 100, height: 100)

                Circle()
                    .trim(from: 0, to: self.to)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 100, height: 100)
                    .rotationEffect(.init(degrees: -90))
                
                HStack(spacing: 20){
                    
                    Button(action: {
                        
                        if self.count == 15{
                            
                            self.count = 0
                            withAnimation(.default){
                                
                                self.to = 0
                            }
                        }
                        self.start.toggle()
                        
                    }) {
                        
                        HStack(spacing: 15){
                            
                            Image(systemName: self.start ? "pause.fill" : "play.fill")
                                .foregroundColor(.white)
                                .padding()
                            
//                            Text(self.start ? "Pause" : "Play")
//                                .foregroundColor(.white)
                        }
                        .background(Color.blue)
                        .clipShape(Circle())

                    }
                }

                                            
                
            
            }
            
        }
        .onAppear(perform: {
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
            }
        })
        .onReceive(self.time) { (_) in
            
            if self.start{
                
                if self.count != 15{
                    
                    self.count += 1
                    print("hello")
                    
                    withAnimation(.default){
                        
                        self.to = CGFloat(self.count) / 15
                    }
                }
                else{
                
                    self.start.toggle()
                    self.Notify()
                }

            }
            
        }
    }
    
    func Notify(){
        
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "Timer Is Completed Successfully In Background !!!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let req = UNNotificationRequest(identifier: "MSG", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}

