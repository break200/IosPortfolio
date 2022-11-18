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
                HStack(spacing: 12){
                    Image("camera")
                        .padding(.leading,15)
                    Spacer()
                    Text("Instagram")
                    Spacer()
                    Image("send")
                        .padding(.trailing,15)
                }
                HStack{
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15){
                            ForEach(1...8,id: \.self){i in
                                ZStack{
                                    Image("p\(i)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                }
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
