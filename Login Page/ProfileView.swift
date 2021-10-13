//
//  Homescreen.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/06/14.
//

import SwiftUI
import Firebase

struct ProfileView : View {
    
    var body: some View{
        
        VStack{
            
            Form{
                
                Section(header: Text("GENERAL SETTINGS")) {
                    
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Image(systemName: "globe")
                            Text("Language options")
                        })
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Image(systemName: "ruler.fill")
                            Text("Metric & Imperial Units")
                        })

                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Text("Delete all data")
                        })
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            
                            Text("my account")
                        })
                }
            }

            
            Spacer()
            
//            Text("Logged SuccessFully")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(Color.black.opacity(0.7))
            
            Button(action: {

                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                
            }) {
                
                Text("Log out")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("Color"))
            .cornerRadius(10)
            .padding(.top, 25)
        }
        
    }
}

