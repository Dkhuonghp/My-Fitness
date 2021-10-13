//
//  HomeWorkoutView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/30.
//

import SwiftUI

struct HomeWorkoutView: View {
    @State private var date = Date()

    var body: some View {
        
        VStack {
            
            VStack {
                
                HStack{
                    
                    Text("HOME WORKOUTS")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                    Spacer()
                    Button(action: {}, label: {

                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 20))
                             .foregroundColor(.black)

                    })
                 
                    
                }

            }
            .padding(.horizontal)

            GeometryReader{_ in
                
                ScrollView(showsIndicators: false){
                    

                    // Beginner
                    VStack(alignment: .leading){

                        ZStack(alignment: .leading){
                            
                            Image("bung5")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
//                                .frame(height: 150)
                                .opacity(0.5)
                                .background(Color.black)
                            
                                
                            VStack(alignment: .leading) {
                                Text("5 Workouts")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Beginner")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                            
                        }
                        
                        VStack {
                            
                            ForEach(1...5, id: \.self) {_ in
                                
                                VStack(alignment: .leading){
                                    
                                    NavigationLink(
                                        destination: Snap(),
                                        label: {
                                            
                                            HStack(spacing: 10) {
                                                
                                                Image("tay 2")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 50, height: 50)
                                                    .cornerRadius(10)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("Bell fat burner HIIt")
                                                        .font(.headline)
                                                        .foregroundColor(.black)
                                                    Text("Beginner")
                                                        .font(.caption)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.gray)
                                                    Divider()
                                                        .foregroundColor(.gray)
                                                        .frame(width: 260, height: 4)
                                                }
                                                .offset(y: 10)
                                                
                                            }
                                            
                                        })
                                        .padding(.vertical, 5)

                                }

                            }

                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                    
                    //Intermediate
                    VStack(alignment: .leading){
                        
                        ZStack(alignment: .leading){
                            
                            Image("bung3")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.5)
                                .background(Color.black)
                            
                                
                            VStack(alignment: .leading) {
                                Text("5 Workouts")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Intermediate")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                            
                        }
                        
                        VStack {
                            
                            ForEach(1...5, id: \.self) {_ in
                                
                                VStack(alignment: .leading){
                                    
                                    NavigationLink(
                                        destination: Text("fdfd"),
                                        label: {
                                            
                                            HStack(spacing: 10) {
                                                
                                                Image("tay 2")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 50, height: 50)
                                                    .cornerRadius(10)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("Bell fat burner HIIt")
                                                        .font(.headline)
                                                        .foregroundColor(.black)
                                                    Text("Beginner")
                                                        .font(.caption)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.gray)
                                                    Divider()
                                                        .foregroundColor(.gray)
                                                        .frame(width: 260, height: 4)
                                                }
                                                .offset(y: 10)
                                                
                                            }
                                            
                                        })
                                        .padding(.vertical, 5)

                                }

                            }

                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                    
                    //Advanced
                    VStack(alignment: .leading){
                        
                        ZStack(alignment: .leading){
                            
                            Image("bung4")
                                .resizable()
                                .scaledToFill()
                                .opacity(0.5)
                                .background(Color.black)
                            
                                
                            VStack(alignment: .leading) {
                                Text("5 Workouts")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white)
                                Text("Advanced")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                            
                        }
                        
                        VStack {
                            
                            ForEach(1...5, id: \.self) {_ in
                                
                                VStack(alignment: .leading){
                                    
                                    NavigationLink(
                                        destination: Text("fdfd"),
                                        label: {
                                            
                                            HStack(spacing: 10) {
                                                
                                                Image("tay 2")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 50, height: 50)
                                                    .cornerRadius(10)
                                                
                                                VStack(alignment: .leading) {
                                                    Text("Bell fat burner HIIt")
                                                        .font(.headline)
                                                        .foregroundColor(.black)
                                                    Text("Beginner")
                                                        .font(.caption)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.gray)
                                                    Divider()
                                                        .foregroundColor(.gray)
                                                        .frame(width: 260, height: 4)
                                                }
                                                .offset(y: 10)
                                                
                                            }
                                            
                                        })
                                        .padding(.vertical, 5)

                                }

                            }

                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                    
                }
            }
            .navigationTitle("Home Workouts")
            .navigationBarHidden(true)
        }
    }
}

struct HomeWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        HomeWorkoutView()
    }
}
