//
//  ColorEx.swift
//  Grocery
//
//  Created by break200 on 2022/11/10.
//

import SwiftUI

extension Color {
    static func RGB(red:CGFloat , green:CGFloat , blue:CGFloat) -> Color{
        return Color(red: red/255.0, green: green/255.0, blue: blue/255.0)
    }
}
