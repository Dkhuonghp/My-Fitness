//
//  GridView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/20.
//

import SwiftUI
struct Item: Identifiable {
    let id = UUID()
    let title : String
    let image: String
    let imgColor : Color
}
struct GridView: View {
    @State var isActive: Bool = false
    @Binding var rootIsActive: Bool
    let items = [
    
        Item(title: "", image: "tay", imgColor: .orange),
        Item(title: "", image: "tay 2", imgColor: .green),
        Item(title: "", image: "strong", imgColor: .blue)

    ]
    let spacing: CGFloat = 10
    @State private var  numberOfRows = 1
    
    var body: some View {

        let columns = Array(
        
            repeating: GridItem(.flexible(), spacing: spacing),
            count: numberOfRows)
        
        ScrollView(showsIndicators: false) {
            
            headerView
                
            VStack {
                
                VStack{
                        
                      ForEach(1...6, id: \.self){ i in
                        NavigationLink(
                            destination: ScrollableTabBar(rootIsActive: $isActive),
                            label: {
                                
                                HStack{
                                                                        
                                   Text("Day \(i)")
                                         .font(.system(size: 25))
                                         .fontWeight(.semibold)
                                         .foregroundColor(.black)
   
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .frame(width: 380,height: 70)
                                .background(Color.black.opacity(0.05).cornerRadius(10))
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
                            })
                      }

                      .padding(.bottom, 10)
                }
                VStack{
                        
                      ForEach(7...13, id: \.self){ i in
                        NavigationLink(
                            destination: LevelUp(rootIsActive: self.$isActive),
                            label: {
                                
                                HStack{
                                                                        
                                   Text("Day \(i)")
                                         .font(.system(size: 25))
                                         .fontWeight(.semibold)
                                         .foregroundColor(.black)
   
                                    Spacer()
                                }
                                .padding(.horizontal)
                                .frame(width: 380,height: 70)
                                .background(Color.black.opacity(0.05).cornerRadius(10))
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0.0, y: 0.0)
   
                            })
                      }

                      .padding(.bottom, 10)
                }
            }
        }
//        .background(Color.black.opacity(0.05))
        .ignoresSafeArea()
    }
    var headerView: some View{
        LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [.sectionHeaders] , content: {
            //
            GeometryReader{reader -> AnyView in
                
                let offset = reader.frame(in: .global).minY
//
//                if -offset >= 0{
//
//                    DispatchQueue.main.async {
//                        self.homeData.offset = -offset
//                    }
//                }
                
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
            //Cards ...
//                Section(header: HeaderView()) {
//
//                    //tabs
//
//                    ForEach(tabsItems){tab in
//
//                        VStack(alignment: .leading, spacing: 15, content: {
//
//                            Text(tab.tab)
//                                .font(.title2)
//                                .fontWeight(.bold)
//                                .padding(.bottom)
//                                .padding(.leading)
//
//                            ForEach(tab.foods){food in
//
//                                CardView(food: food)
//                            }
//                            //Divider thanh ngăn cách giữa 2 dòng
//                            Divider()
//                                .padding(.top)
//                        })
//                        .tag(tab.tab)
//                        .overlay(
//
//                            GeometryReader{reader -> Text in
//
//                                let offset = reader.frame(in: .global).minY
//
//                                let height = UIApplication.shared.windows.first!.safeAreaInsets.top + 100
//                                if offset < height && offset > 50 && homeData.selectedtab != tab.tab{
//                                    DispatchQueue.main.async {
//                                        self.homeData.selectedtab = tab.tab
//                                    }
//                                }
//
//                                return Text("")
//                            }
//
//                        )
//                    }
//                }
        })
    }
}

//struct ItemButtonStyle: ButtonStyle {
//    let cornerRadius: CGFloat
//
//    func makeBody(configuration: Configuration) -> some View {
//
//        ZStack{
//
//            if configuration.isPressed{
//                Color.black.opacity(0.2)
//            }
//        }
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
//    }
//}
//struct ItemView: View {
//    let item : Item
//    var body: some View{
//
//        GeometryReader { reader in
//
//            let fontSize = min(reader.size.width * 0.2, 28)
//            let imageWidth: CGFloat = min(50, reader.size.width * 0.6)
//
//            VStack(spacing: 5){
//
//                Image(item.image)
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundColor(item.imgColor)
//                    .frame(width: imageWidth)
//                Text(item.title)
//                    .font(.system(size: fontSize, weight: .bold, design: .rounded)) //rounded lam tron
//                    .foregroundColor(Color.black.opacity(0.9))
//            }
//            .frame(width: reader.size.width, height: reader.size.height)
//            .background(Color.white)
//        }
//        .frame(height: 50)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
//    }
//}

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}
