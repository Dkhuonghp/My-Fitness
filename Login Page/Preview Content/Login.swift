//
//  Login.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/06/14.
//

import SwiftUI
import Firebase
import YoutubeKit
import LocalAuthentication

struct Login: View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View{
        
        ZStack{
            
            ZStack(alignment: .topTrailing){
                
                GeometryReader{_ in
                
                    VStack{
                        
                        HStack{

                            Button(action: {
                                withAnimation(.easeInOut) {
                                    
                                    currentPage -= 1

                                }
                            }, label: {
                                Image(systemName:"chevron.left")
                                    .foregroundColor(.black)
                                    .frame(width: 40, height: 20)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(Color.white)
                                    .cornerRadius(15)

                            })
                            .shadow(color: Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), radius: 5, x: 5, y: 5)
                            .shadow(color: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), radius: 5, x: -5, y: -5)

                            Spacer()

                        }
                        
                        PickerView()

                        
                        Text("logn in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        TextField("Email", text: self.$email)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("color") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            
                            VStack{
                                
                                if self.visible{
                                    
                                    TextField("Password", text: self.$pass)
                                }
                                else{
                                    SecureField("Password" ,text: self.$pass)
                                }
                            }
                            
                            Button(action: {
                                
                                self.visible.toggle()
                                
                            }) {
                                
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                                
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack{
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.reset()

                            }){
                                Text("Foreget password")
                                    .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top, 20)
                        
                        // FaceID
                        
                        Button(action: {
                            
                            self.verify()
                            
                        }){
                            Text("Log in")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                    
                }
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    
    func verify(){
        
        if self.email != "" && self.pass != ""{
            
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in

                if err != nil{

                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }

                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"),object: nil)
            }
        }
        else{
            
            self.error = "Please fill all the content properly"
            self.alert.toggle()
        }
    }
    
    func reset(){
        
        if self.email != ""{
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Email Id is emtry"
            self.alert.toggle()
        }
    }
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
