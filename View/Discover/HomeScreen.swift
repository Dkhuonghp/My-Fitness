//
//  ImageView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @Binding var isLiked: Bool
    
    var body: some View {
        VStack {
                
            HStack{
                Text("DISCOVER")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {

                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 20))
                        .foregroundColor(.black)

                })
             
                
            }
            .padding(.horizontal)
            
            ScrollView (showsIndicators: false) {
                
                VStack (alignment: .leading) {
                    
                    Text("You might also like")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 0) {
                            
                            VStack(alignment: .leading) {
                                
                                ZStack{
                                    
                                    Image("bung3")
                                        .resizable()
                                        .frame(width: 300, height: 180)
                                        .opacity(0.5)
                                    VStack(alignment: .leading){
                                        Text("CUSTOM WORKOUT")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)

                                        Text("SMART CREATOR")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                        
                                    }
                                }
                                .background(Color.black)
                                .cornerRadius(10)
                                
                            }
                            .padding()

                            NavigationLink(
                                destination: MapLocation(),
                                label: {
                                    
                                    ProductCardView2(size: 300)
                                })
                        }
                    }
                    HStack {
                        Text("Select by goals")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.top)
                        Spacer()
                    }
                    .padding(.horizontal)
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack (spacing: 0) {
                            
                            ProductCardView3(isLiked: $isLiked, size: 340)
                            
                            ProductCardView3(isLiked: $isLiked, size: 340)

                            ProductCardView3(isLiked: $isLiked, size: 340)

                            ProductCardView3(isLiked: $isLiked, size: 340)

                            ProductCardView3(isLiked: $isLiked, size: 340)

                        }
                    }
                    
                    HStack {
                        Text("Guess you might need")
                            .font(.system(size: 17))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.top)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ForEach(1...6, id: \.self) {_ in
                        
                        VStack(alignment: .leading){
                            
                            NavigationLink(
                                destination: DetailScreen(isLiked: $isLiked),
                                label: {
                                    
                                    HStack(spacing: 10) {
                                        
                                        Image("tay 2")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 70, height: 70)
                                            .clipShape(Circle())
                                        
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
                        }

                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    
//                    ScrollView (.vertical, showsIndicators: false) {
//
//                        VStack (spacing: 0) {
//
//
//                            NavigationLink(
//                                destination: Cuttom(),
//                                label: {
//
//                                    VStack {
//                                        Image("tap tay")
//                                            .resizable()
//                                            .edgesIgnoringSafeArea(.all)
//                                    }
//
//
//                                })
//                                .foregroundColor(.white)
//                                .frame(height: 220, alignment: .center)
//
//                        }
//                        .background(Color.black)
//                        .cornerRadius(10)
//                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
//                        .padding(.horizontal)
//                        .padding(.bottom, 10)
//
//                        VStack (spacing: 0) {
//
//
//                            NavigationLink(
//                                destination: DetailScreen(isLiked: $isLiked),
//                                label: {
//
//                                    VStack {
//                                        Image("feet")
//                                            .resizable()
//                                            .edgesIgnoringSafeArea(.all)
//                                    }
//
//
//                                })
//                                .foregroundColor(.white)
//                                .frame(height: 220, alignment: .center)
//
//                        }
//                        .background(Color.black)
//                        .cornerRadius(10)
//                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
//                        .padding(.horizontal)
//                        .padding(.bottom, 10)
//                        VStack (spacing: 0) {
//
//
//                            NavigationLink(
//                                destination: DetailScreen(isLiked: $isLiked),
//                                label: {
//
//                                    VStack {
//                                        Image("tay 2")
//                                            .resizable()
//                                            .edgesIgnoringSafeArea(.all)
//                                    }
//
//
//                                })
//                                .foregroundColor(.white)
//                                .frame(height: 220, alignment: .center)
//
//                        }
//                        .background(Color.black)
//                        .cornerRadius(10)
//                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
//                        .padding(.horizontal)
//                        .padding(.bottom, 10)
//                        VStack (spacing: 0) {
//
//
//                            NavigationLink(
//                                destination: DetailScreen(isLiked: $isLiked),
//                                label: {
//
//                                    VStack {
//                                        Image("full body")
//                                            .resizable()
//                                            .edgesIgnoringSafeArea(.all)
//                                    }
//
//
//                                })
//                                .foregroundColor(.white)
//                                .frame(height: 220, alignment: .center)
//
//                        }
//                        .background(Color.black)
//                        .cornerRadius(10)
//                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
//                        .padding(.horizontal)
//                        .padding(.bottom, 10)
//                        VStack (spacing: 0) {
//
//
//                            NavigationLink(
//                                destination: DetailScreen(isLiked: $isLiked),
//                                label: {
//
//                                    VStack {
//                                        Image("tay")
//                                            .resizable()
//                                            .edgesIgnoringSafeArea(.all)
//                                    }
//
//
//                                })
//                                .foregroundColor(.white)
//                                .frame(height: 220, alignment: .center)
//
//                        }
//                        .background(Color.black)
//                        .cornerRadius(10)
//                        .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
//                        .padding(.horizontal)
//                        .padding(.bottom, 10)
//                    }
//                    .foregroundColor(.black)
//                    .padding(.vertical)
                    
                    
                }
            }
            
//            VStack {
//                Spacer()
//                BottomNavBarView()
//            }
        }
        
        
        .navigationBarTitle("") //this must be empty
        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
            + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color("Primary"))
    }
}




struct ProductCardView2: View {
//    let image: Image
    let size: CGFloat
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            ZStack{
                
                Image("bung2")
                    .resizable()
                    .frame(width: size, height: 180)
                    .opacity(0.5)
                VStack(alignment: .leading){
                    Text("WALK & RUN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.bold)

                    Text("WITH MAP TRACKING")
                        .font(.caption)
                        .foregroundColor(.white)
                    
                }
            }
            .background(Color.black)
            .cornerRadius(10)
            
        }
        .frame(width: size)
        .padding()
        
    }
}
struct ProductCardView3: View {
    @Binding var isLiked: Bool

//    let image: Image
    let size: CGFloat
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            NavigationLink(
                destination: Text("Destination"),
                label: {
                    ZStack{
                        
                        Image("bung3")
                            .resizable()
                            .frame(width: size, height: 150)
                            .opacity(0.5)
                        VStack(alignment: .leading){
                            Text("CUSTOM WORKOUT")
                                .font(.headline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)

                            Text("SMART CREATOR")
                                .font(.caption)
                                .foregroundColor(.white)
                            
                        }
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                })
            
            VStack(alignment: .leading){
                
                NavigationLink(
                    destination: DetailScreen(isLiked: $isLiked),
                    label: {
                        
                        HStack(spacing: 10) {
                            
                            Image("tay 2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
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

                NavigationLink(
                    destination: DetailScreen(isLiked: $isLiked),
                    label: {
                        
                        HStack(spacing: 10) {
                            
                            Image("tay 2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .cornerRadius(10)
                                .padding(.vertical, 5)
                            
                            VStack(alignment: .leading) {
                                Text("Bell fat burner HIIt")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text("Intermediate")
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
                NavigationLink(
                    destination: DetailScreen(isLiked: $isLiked),
                    label: {
                        
                        HStack(spacing: 10) {
                            
                            Image("tay 2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .cornerRadius(10)
                                .padding(.vertical, 5)
                            
                            VStack(alignment: .leading) {
                                Text("Bell fat burner HIIt")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                Text("Advanced")
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
            }

        }
        .frame(width: size)
        .padding()
        
    }
}



struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("Home"), action: {})
            BottomNavBarItem(image: Image("fav"), action: {})
            BottomNavBarItem(image: Image("shop"), action: {})
            BottomNavBarItem(image: Image("User"), action: {})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
