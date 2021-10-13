//
//  Place.swift
//  Map
//
//  Created by NGUYEN DUY KHUONG on 2021/07/11.
//

import SwiftUI
import MapKit

struct Place: Identifiable {

    var id = UUID().uuidString
    var placemark: CLPlacemark
}

