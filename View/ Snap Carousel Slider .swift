//
//  test.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/08/02.
//

import SwiftUI

struct Snap: View {
    @State var CurrentIndex: Int = 0
    
    @State var posts: [Post] = []
    
    @State var currentTab = "Slider Show"
    @Namespace var animation
    
    var body: some View{
        
        VStack(spacing: 15) {
            
            SnapCarousel(spacing: 25,index: $CurrentIndex, items: posts) {post in
                GeometryReader{proxy in
                    
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                }
            }
            .padding(.vertical, 100)
            
            HStack(spacing: 10){

                ForEach(posts.indices,id: \.self){index in
                    Circle()
                        .fill(Color.black.opacity(CurrentIndex == index ? 1 : 0.1))
                        .frame(width: 10, height: 10)
                        .scaleEffect(CurrentIndex == index ? 1.4 : 1)
                        .animation(.spring(), value: CurrentIndex == index)
                }
            }
            .padding(.bottom, 40)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear{
            for index in 1...5{
                posts.append(Post(postImage: "bung\(index)"))
            }
        }
    }
}

struct SnapCarousel<Content: View,T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100,index: Binding<Int>,items: [T],@ViewBuilder content:@escaping (T)->Content){
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    @GestureState var offset : CGFloat = 0
    @State var currentIndex: Int = 0
    var body: some View{
        
        GeometryReader{proxy in
            //setting correct width for snap
            
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing){
                
                ForEach(list){item in
                    
                    content(item)
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            .padding(.horizontal,spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
            .gesture(
                
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded({ value in
                        // Updating current index
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        currentIndex = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        currentIndex = index
                    })
                    .onChanged({value in
                        
                        // Updating current index
                        let offsetX = value.translation.width
                        
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        index = max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                    })
            )
        }
        .animation(.easeInOut, value: offset == 0)
    }
}

struct TabButton: View {
    var title: String
    var animation: Namespace.ID
    @Binding var currentTab: String
    
    var body: some View{
        
        Button{
            withAnimation(.spring()){
                currentTab = title
            }
        } label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(currentTab == title ? .white : .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(
                    ZStack{
                        if currentTab == title{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                )
        }
    }
}

struct Post: Identifiable {
    var id = UUID().uuidString
    var postImage: String
}
