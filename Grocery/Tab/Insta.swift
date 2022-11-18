//
//  Wishlist.swift
//  Grocery
//
//  Created by break200 on 2022/11/08.
//

import SwiftUI

struct Insta: View {
    var body: some View {
        VStack(spacing: 15) {
            ScrollView(.vertical, showsIndicators: false){
                Text("테스트")
            }
        }
    }
}

struct Wishlist_Previews: PreviewProvider {
    static var previews: some View {
        Insta()
            .previewDevice("iPhone 14 Pro Max")
        Insta()
            .previewDevice("iPhone 14 Pro")
        Insta()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
