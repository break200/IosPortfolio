//
//  ContentView.swift
//  Grocery
//
//  Created by break200 on 2022/11/08.
//

import SwiftUI

//MARK: - 텝 카테고리
enum Tab: String, CaseIterable {
    case Grocery
    case Insta
    case Uber
    case Dessert
}

//MARK: - 탭 string Array
let tabs = [Tab.Grocery.rawValue,
            Tab.Insta.rawValue,
            Tab.Uber.rawValue,
            Tab.Dessert.rawValue]

//MARK: - ContentView
struct ContentView: View {
    
    //초기화값 세팅
    @State var selectedTab:Tab = .Grocery
    
    var body: some View {
        NavigationView{
            VStack{
                switch selectedTab {
                case .Grocery:
                    Grocery()
                case .Insta:
                    Insta()
                case .Uber:
                    Uber()
                case .Dessert:
                    Dessert()
                }
                Spacer()
                ContentTabView(selected: $selectedTab)
            }
        }.navigationBarTitle("")
         .navigationBarHidden(false)
         .navigationBarBackButtonHidden(false)
        // 네비게이션 화면 
    }
}

//MARK: - TABBAR
struct ContentTabView:View{
    
    @Binding var selected:Tab
    
    var body: some View {
        
        HStack{
            ForEach(tabs , id: \.self) { i in
                VStack(spacing: 10) {
                    Capsule()
                        .fill(.clear)
                        .frame(height: 5)
                        .overlay(
                            Capsule().fill(self.selected.rawValue == i ? Color("Color") : Color.clear).frame(width: 55, height: 5)
                         )
                    Button {
                        switch i {
                            case Tab.Grocery.rawValue:
                              selected = .Grocery
                            case Tab.Insta.rawValue:
                              selected = .Insta
                            case Tab.Uber.rawValue:
                              selected = .Uber
                            default:
                              selected = .Dessert
                        }
                    } label: {
                        VStack{
                            Image(i).renderingMode(.original)
                            Text(i).foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
        ContentView()
            .previewDevice("iPhone 14 Pro")
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}

