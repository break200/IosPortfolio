//
//  ContentView.swift
//  Grocery
//
//  Created by break200 on 2022/11/08.
//

import SwiftUI

//MARK: - 텝 카테고리
enum CategoryTab:String{
    case GROCERY = "Grocery";
    case INSTA = "Insta";
    case UBER = "Uber";
    case DESSERT = "Dessert";
}

let tabs = [CategoryTab.GROCERY.rawValue,
            CategoryTab.INSTA.rawValue,
            CategoryTab.UBER.rawValue,
            CategoryTab.DESSERT.rawValue]

//MARK: - ContentView
struct ContentView: View {
    
    @State var selTab:CategoryTab = .GROCERY
    
    var body: some View {
        NavigationView{
            VStack{
                switch selTab {
                case .GROCERY:
                    Grocery()
                case .INSTA:
                    Insta()
                case .UBER:
                    Uber()
                case .DESSERT:
                    Uber()
                }
                Spacer()
                ContentTabView(selected: $selTab)
            }
        }.navigationBarTitle("")
         .navigationBarHidden(false)
         .navigationBarBackButtonHidden(false)
    }
}

//MARK: - TABBAR
struct ContentTabView:View{
    
    @Binding var selected:CategoryTab
    
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
                            case CategoryTab.GROCERY.rawValue:
                              selected = .GROCERY
                            case CategoryTab.INSTA.rawValue:
                              selected = .INSTA
                            case CategoryTab.UBER.rawValue:
                              selected = .UBER
                            default:
                              selected = .DESSERT
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

