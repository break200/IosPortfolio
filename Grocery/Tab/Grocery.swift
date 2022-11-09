//
//  Home.swift
//  Grocery
//
//  Created by break200 on 2022/11/08.
//

import SwiftUI

struct Grocery: View {
    
    @State var txt = ""
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 12){
                Image(systemName: "car.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Hi break200").font(.body)
                Spacer()
                Button {
                    print("오른쪽 찍힘")
                } label: {
                    Image("filter").renderingMode(.original)
                }
            }
            ScrollView(.vertical ,showsIndicators: false){
                VStack(spacing: 15) {
                    HStack(spacing: 10) {
                        //테스트필터 커스텀
                        HStack{
                            Image(systemName: "magnifyingglass").font(.body)
                            TextField("Search Groceries",text: $txt)
                        }.padding(10)
                        .background(Color("Color1"))
                        .cornerRadius(10)
                        Button {
                            print("mic")
                        } label: {
                            Image("mic").renderingMode(.original)
                        }

                    }
                    HStack{
                        Image("top").renderingMode(.original).resizable().frame(maxWidth: .infinity,minHeight: UIScreen.main.bounds.width * 0.5)
                    }
                    
                    HStack{
                        Text("Categories").font(.title)
                        Spacer()
                        Button {
                            print("Categories more")
                        } label: {
                            Text("More").foregroundColor(Color("Color"))
                        }
                    }
                    HStack{
                        ScrollView(.horizontal,showsIndicators: false){
                            
                        }
                    }
                    
                }
            }
            
            
        }.padding(.horizontal)
    }
}

struct Home_Previews: PreviewProvider {
//    static var previews: some View {
////        Home()
//        ContentView()
//    }
    
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
        ContentView()
            .previewDevice("iPhone 14 Pro")
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
