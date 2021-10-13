//
//  MyPlantsView.swift
//  Plant Activity Tracker
//
//  Created by Usman Mukhtar on 19/09/2020.
//

import SwiftUI

struct MyPlantsView: View {
    @State var searchText = ""
    @State var isActive: Bool = false
    @State private var  numberOfRows = 1

    
    var body: some View {
//        VStack {
//            SearchBar(text: $searchText)
//
//            List(plants.filter({ "\($0)".contains(searchText.lowercased()) || searchText.isEmpty })){ plants in
//                NavigationLink(
//                    destination: DetailedView(rootIsActive: self.$isActive),
//                    isActive: self.$isActive,
//                    label: {
//                        ZStack{
//
//                            Image(plants.image)
//                                .resizable()
//                                .frame(width: 330, height: 160)
//                                .cornerRadius(10)
//
//                            Text(plants.title.capitalized)
//                        }
//                        .background(Color(.gray))
//
//                    })
//                    .frame(height: 160)
//            }
//        }
//        .navigationTitle("My Plants")
        
        
    
        VStack{
            
            ZStack{

                HStack{

                    Spacer()

                    Button(action: {


                    }, label: {

                        Image(systemName: "star")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.gray)
//                            .padding(.all)
                    })
                }
                Text("Now Playing")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)

            }

            ScrollView{
                headerView
                VStack(alignment: .center){

                    // Trình độ đơn giản
                    VStack{

                        NavigationLink(
                                  destination: calender(rootIsActive: self.$isActive),
                            isActive: self.$isActive,
                                  label: {

                                      VStack {

                                          ZStack{

                                              Image("feet")
                                                .frame(alignment: .center)
                                                .opacity(0.7)

                                                Text("TẬP CHÂN")
                                                  .font(.system(size: 24))
                                                  .fontWeight(.semibold)
                                                  .foregroundColor(.white)
                                          }
                                      }
                                  })
                            .foregroundColor(.white)
                            .frame(width: 380, height: 160, alignment: .center)
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 10)

                    //Trình độ trung bình
                    VStack{

                        NavigationLink(
                            destination: calender(rootIsActive: self.$isActive),
                            isActive: self.$isActive,
                                  label: {

                                      VStack {

                                          ZStack{

                                              Image("full body")
                                                .frame(alignment: .center)
                                                .opacity(0.7)

                                                Text("TẬP CƠ BỤNG")
                                                  .font(.system(size: 24))
                                                  .fontWeight(.semibold)
                                                  .foregroundColor(.white)
                                          }
                                      }
                                  })
                            .foregroundColor(.white)
                            .frame(width: 380, height: 160, alignment: .center)
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 10)

                    // Trình độ khó
                    VStack{

                        NavigationLink(
                            destination: calender(rootIsActive: self.$isActive),
                            isActive: self.$isActive,
                                  label: {

                                      VStack {

                                          ZStack{

                                              Image("tay")
                                                .frame(alignment: .center)
                                                .opacity(0.7)

                                                Text("TẬP TAY")
                                                  .font(.system(size: 24))
                                                  .fontWeight(.semibold)
                                                  .foregroundColor(.white)
                                          }
                                      }
                                  })
                            .foregroundColor(.white)
                            .frame(width: 380, height: 160, alignment: .center)
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 10)
                    //
                    VStack{

                        NavigationLink(
                            destination: calender(rootIsActive: self.$isActive),
                            isActive: self.$isActive,
                                  label: {

                                      VStack {

                                          ZStack{

                                              Image("tay 2")
                                                .frame(alignment: .center)
                                                .opacity(0.7)

                                                Text("TẬP TAY")
                                                  .font(.system(size: 24))
                                                  .fontWeight(.semibold)
                                                  .foregroundColor(.white)
                                          }
                                      }
                                  })
                            .foregroundColor(.white)
                            .frame(width: 380, height: 160, alignment: .center)
                    }
                    .background(Color.black)
                    .cornerRadius(10)
                    .shadow(color: Color.white.opacity(0.3), radius: 10, x: 0, y: 0)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 10)


                }
                .offset(y: -120)
            }
            .background(Color.white)
            .ignoresSafeArea()
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    var headerView: some View{
        
        LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders] , content:{
            
            GeometryReader{reader -> AnyView in
                
                let offset = reader.frame(in: .global).minY
                
//                    if -offset >= 0{
//
//                        DispatchQueue.main.async {
//                            self.homeData.offset = -offset
//                        }
//                    }
                
                return AnyView(
                    
                    Image("")
                        .resizable()
                        .background(Color.gray)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                        .cornerRadius(2)
                        .offset(y: (offset > 0 ? -offset : 0))
                        .overlay(
                        
                            HStack{
                                
                                Button(action: {}, label: {
                                    Image(systemName: "arror.left")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                })
                                Spacer()
                                
                                Button(action: {}, label: {
                                    Image(systemName: "suit.heart.fill")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                })
                            }
                            .padding(),
                            alignment: .top
                        )
                )
            }
            .frame(height: 250)
        })
            .frame(height: 350)
            .frame(maxWidth:500)
    }

}

struct MyPlantsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPlantsView()
    }
}

//struct Plants: Identifiable {
//    var id = UUID()
//    var title: String
//    var image: String
//}
