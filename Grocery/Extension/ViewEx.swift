//
//  ViewEx.swift
//  Grocery
//
//  Created by break200 on 2022/11/12.
//

import Foundation
import SwiftUI

//placeholder 확장
extension View {
    func placeholder<Content:View>( when shouldShow:Bool, alignment:Alignment = .leading , @ViewBuilder placeholder: () -> Content) -> some View{
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
