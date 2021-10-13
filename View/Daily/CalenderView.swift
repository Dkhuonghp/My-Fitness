//
//  CalenderView.swift
//  Login Page
//
//  Created by NGUYEN DUY KHUONG on 2021/07/20.
//

import SwiftUI
import UIKit
import FSCalendar

struct CalenderView: View {
    @State var selectedDate: Date = Date()
    
    var body: some View {
        
            
        VStack{
            
            GeometryReader{_ in
                
                ScrollView(showsIndicators: false) {
                    
                    VStack{
                        
                        TabBar()

                        CalenderRepresentable(selectedDate: $selectedDate)
                            .padding(.horizontal)
                            .background(

                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.white)
                                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
                            )
                            .frame(height: 350)
                            .padding(.horizontal)
                        HistoryView()
                            .padding(.vertical)
                    }
                }
            }
        }
        .navigationBarTitle("") //this must be empty
        .navigationBarHidden(true)
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}

struct CalenderRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    
    var calender = FSCalendar()
   @Binding var selectedDate: Date
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        
        calender.delegate = context.coordinator
        calender.dataSource = context.coordinator
        
        calender.allowsMultipleSelection = false
        
//        calender.appearance.headerDateFormat = "yyy/MM/dd"
        
        calender.appearance.eventDefaultColor = .orange
        
        return calender
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        
        var parent: CalenderRepresentable
        
        init(_ parent: CalenderRepresentable) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            if parent.selectedDate == date {
                
                return 1
            } else { return 0 }
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            
            parent.selectedDate = date
            
        }
        
        func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
            
            
        }
    }
}
