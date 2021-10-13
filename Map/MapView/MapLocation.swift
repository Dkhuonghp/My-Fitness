//
//  Home.swift
//  Map
//
//  Created by NGUYEN DUY KHUONG on 2021/07/11.
//

import SwiftUI
import CoreLocation

struct MapLocation: View {
    @StateObject var mapData = MapViewModel()
    // Location Manager
    @State var locationManager = CLLocationManager()
    @State var showFilter = false
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State private var isShowingSheet = false



    
    var body: some View {
        
        ZStack{
            // Map View...
            MapView()
                .environmentObject(mapData)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack{
                
                // Search
//                VStack(spacing: 0){
//
//                    HStack{
//
//                        Image(systemName: "magnifyingglass")
//                            .foregroundColor(.gray)
//                        TextField("Search", text: $mapData.searchTxt)
//                            .colorScheme(.light)
//                    }
//                    .padding(.vertical, 10)
//                    .padding(.horizontal)
//                    .background(Color.white)
//
//                    if !mapData.places.isEmpty && mapData.searchTxt != ""{
//
//                        ScrollView{
//
//                            VStack(spacing: 15){
//
//                                ForEach(mapData.places){place in
//
//                                    Text(place.placemark.name ?? "")
//                                        .foregroundColor(.black)
//                                        .frame(maxWidth: .infinity,alignment: .leading)
//                                        .padding(.leading)
//                                        .onTapGesture {
//                                            mapData.selectPlace(place: place)
//                                        }
//                                    Divider()
//                                }
//                            }
//                            .padding(.top)
//                        }
//                        .background(Color.white)
//                    }
//
//                }
//                .cornerRadius(10)
//                .padding()
                
                
                // Radio Button View

                VStack{
                    
                    Spacer()
                    
                    ZStack(alignment: .bottom){
                        
                        HStack(spacing: 30){
                            
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(Color.white)
                                    .frame(width: 60, height: 60)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)


                                
                                RoundedRectangle(cornerRadius: 35, style: .continuous)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .frame(width: 60, height: 60)

                                    .padding(2)
                                    .blur(radius: 2)
                                
                                Button(action: mapData.focusLocation, label: {
                                   
                                    Image(systemName: "location.fill")
                                        .font(.title2)
                                        .padding(10)
       
                                })
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 35, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), radius: 2, x: 2, y:2)
                            .shadow(color: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), radius: 1, x: -1, y: -1)
                            
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(Color.white)
                                    .frame(width: 60, height: 60)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)


                                
                                RoundedRectangle(cornerRadius: 35, style: .continuous)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .frame(width: 60, height: 60)

                                    .padding(2)
                                    .blur(radius: 2)
                                
                                Button(action: {withAnimation{showFilter.toggle()}}, label: {
                                    
                                    Image(systemName: "slider.vertical.3")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                        .padding(10)


                                })
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 35, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), radius: 2, x: 2, y: 2)
                            .shadow(color: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), radius: 1, x: -1, y: -1)
                            
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(Color.white)
                                    .frame(width: 60, height: 60)
                                    .blur(radius: 4)
                                    .offset(x: -8, y: -8)


                                
                                RoundedRectangle(cornerRadius: 35, style: .continuous)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .frame(width: 60, height: 60)

                                    .padding(2)
                                    .blur(radius: 2)
                                
                                Button(action: mapData.updateMapType, label: {
                                    
                                    Image(systemName: mapData.mapType == .standard ? "network" : "map")
                                        .font(.title2)
                                        .padding(10)

                                })
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 35, style: .continuous))
                            .shadow(color: Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)), radius: 2, x: 2, y: 2)
                            .shadow(color: Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)), radius: 1, x: -1, y: -1)

                        }
                        .padding(.vertical)
                        VStack(spacing: 18){
                            

                            RateView()


                        }
                        .padding(.bottom, 10)
                        .padding(.bottom,edges?.bottom)
                        .padding(.top, 10)
                        .background(Color.white.clipShape(CustomCorner(corners: [.topLeft,.topRight])))
                        .offset(y: showFilter ? 0 : UIScreen.main.bounds.height / 1)
                        
                    }
                    
                }
                
                .ignoresSafeArea()
                .background(
                    Color.black.opacity(0.2).ignoresSafeArea()
                        .opacity(showFilter ? 1 : 0)
                    
                    //you can also add close here
                        .onTapGesture(perform: {

                            withAnimation{showFilter.toggle()}
                        })
                
                )
            }
        }
        .onAppear(perform: {
            
            locationManager.delegate = mapData
            locationManager.requestWhenInUseAuthorization()
        })
        .alert(isPresented: $mapData.permissionDenied, content: {
            Alert(title: Text("permission Denied"), message: Text("please Enable permission In App Settings"), dismissButton: .default(Text("Go To Setting"), action: {
                
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                
            }))
        })
        .onChange(of: mapData.searchTxt, perform: { value in
            // searching Places...
            // You can use your own delay time to avoid countinous Search Request...
            let delay = 0.3
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                if value == mapData.searchTxt{
                    
                    self.mapData.searchQuery()
                }
            }
        })
    }
    func didDismiss() {
        // Handle the dismissing action.
    }
}
struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: 10, height:10))
        
        return Path(path.cgPath)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        MapLocation()
    }
}
