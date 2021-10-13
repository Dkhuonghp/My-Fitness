//
//  Data.swift
//  MapView
//
//  Created by NGUYEN DUY KHUONG on 2021/07/06.
//

import SwiftUI

let data = [
    DataItem(imageName: "drop.fill", imageColor: Color.blue, value: "0", unit: ""),
    DataItem(imageName: "flame.fill", imageColor: Color.orange, value: "0", unit: "Kcal"),
    DataItem(imageName: "stopwatch.fill", imageColor: Color.green, value: "0", unit: "Time"),
    DataItem(imageName: "suit.heart.fill", imageColor: Color.red, value: "0", unit: "Bpm"),
//    DataItem(imageName: "location.fill", imageColor: Color("color"), value: "0", unit: "steps"),

]

struct DataItem {
    let id = UUID()
    let imageName: String
    let imageColor: Color
    var value: String
    let unit: String
}

struct StepData {
    var count: Int = 0
    var mileCount: CGFloat = 0
    var caloryCount: Int = 0
    var minuteCount: Int = 0
    var goal: Int
}

let tabs = [

    Page(image: "spaceship", title: "tab content 1", text: "Tab 001 "),
    Page(image: "spaceship", title: "tab content 2", text: "Tab 002 "),
    Page(image: "spaceship", title: "tab content 3", text: "Tab 003 "),
    Page(image: "spaceship", title: "tab content 4", text: "Tab 004 "),
    Page(image: "spaceship", title: "tab content 5", text: "Tab 005 "),
    Page(image: "spaceship", title: "tab content 6", text: "Tab 006 "),

]

struct Page {

    let image: String
    let title: String
    let text: String
}

let menus: [Models.DashboardMenu] = [
    Models.DashboardMenu(title: "Heart Rate", name: "bolt.heart.fill", unit: "bpm", currentValue: "120"),
    Models.DashboardMenu(title: "Disatance", name: "bolt", unit: "meter", currentValue: "290"),
    Models.DashboardMenu(title: "Water Intake", name: "drop", unit: "millilitre", currentValue: "480"),
    Models.DashboardMenu(title: "Temparature", name: "thermometer", unit: "degree", currentValue: "98.7")
]

let bpms: [Models.BPM] = [
    Models.BPM(value: 86, time: "2 pm"),
    Models.BPM(value: 91, time: "3 pm"),
    Models.BPM(value: 84, time: "4 pm"),
    Models.BPM(value: 124, time: "5 pm"),
    Models.BPM(value: 148, time: "6 pm"),
    Models.BPM(value: 116, time: "7 pm")
]

let heartRateMenus: [Models.HeartRateMenu] = [
    Models.HeartRateMenu(id: 0, name: "Resting", currentValue: 80),
    Models.HeartRateMenu(id: 1, name: "Gym", currentValue: 140)
]


