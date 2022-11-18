//
//  Home.swift
//  Grocery
//
//  Created by break200 on 2022/11/08.
//

import SwiftUI

//MARK: 카테고리 모델
struct Categories:Identifiable {
    var id = UUID()
    let name:String
    let color:Color
    let image:String
    
    static var categories = [
        Categories(name: "Fruits", color: Color.RGB(red: 95, green: 171, blue: 49), image: "Fruits"),
        Categories(name: "Vegetables", color: Color.RGB(red: 238, green: 239, blue: 140), image: "Vegetables"),
        Categories(name: "Beverages", color: Color.RGB(red: 245, green: 231, blue: 82), image: "Beverages"),
        Categories(name: "Fish", color: Color.RGB(red: 124, green: 224, blue: 195), image: "Fish"),
        Categories(name: "Breads", color: Color.RGB(red: 102, green: 74, blue: 246), image: "Breads")
    ]
}

struct NewItem:Identifiable{
    var id = UUID()
    let name:String
    let image:String
    let des:String
    
    static var newItems = [
      NewItem(name: "Frozen Fish", image: "f1", des: "20.00 / pcs"),
      NewItem(name: "Seedless Lemon", image: "f2", des: "30.00 / kg"),
      NewItem(name: "coffee Bread", image: "f3", des: "15.00 / pack")
    ]
}

struct Recipe:Identifiable{
    var id = UUID()
    let image:String
    let userimg:String
    let name:String
    let des:String
    
    static var recipes = [
        Recipe(image: "r1", userimg: "rp1", name: "Basuk Pasta", des: "Karlien Nijhuis"),
        Recipe(image: "r2", userimg: "rp2", name: "Banana Rice", des: "Harmen Porter"),
        Recipe(image: "r3", userimg: "rp3", name: "Basuk Pasta", des: "Marama Peter"),
    ]
}


struct Grocery: View {
    
    @State var txt = ""
    
    var body: some View {
        VStack(spacing: 15) {
            NaviTopView(name: getEmail())
            ScrollView(.vertical ,showsIndicators: false){
                VStack(spacing: 15) {
                    //서치바
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
                    //탑 이미지
                    HStack{
                        Image("top").renderingMode(.original)
                            .resizable().frame(maxWidth: .infinity,minHeight: UIScreen.main.bounds.width * 0.4)
                            .overlay{
                                VStack(alignment: .leading, spacing: 20) {
                                    Spacer()
                                    HStack{
                                        Text("GET 20% OFF")
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                            .padding(20)
                                        Spacer()
                                    }
                                }
                            }
                    }
                    //카테고리
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
                            HStack {
                                ForEach(Categories.categories) { item in
                                    Button {
                                      print("찍힘")
                                    } label: {
                                        VStack{
                                            Image(item.image)
                                            Text(item.name)
                                                .foregroundColor(.black)
                                        }.padding(.trailing,10)
                                    }
                                }
                            }
                        }
                    }
                    //Fresh New item
                    HStack{
                        Text("Fresh New Item").font(.title)
                        Spacer()
                        Button {
                            print("Fresh New Item more")
                        } label: {
                            Text("More").foregroundColor(Color("Color"))
                        }
                    }
                    HStack{
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack {
                                ForEach(NewItem.newItems) { item in
                                    Button {
                                      print("찍힘")
                                    } label: {
                                        VStack{
                                            Image(item.image)
                                            Text(item.name)
                                                .foregroundColor(.black)
                                                .font(.title2)
                                            Text(item.des)
                                                .foregroundColor(.green)
                                                .font(.caption)
                                        }.padding(.trailing,10)
                                    }
                                }
                            }
                        }
                    }
                    //Recipe
                    HStack{
                        Text("Recipe").font(.title)
                        Spacer()
                        Button {
                            print("Recipe more")
                        } label: {
                            Text("More").foregroundColor(Color("Color"))
                        }
                    }
                    HStack{
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack {
                                ForEach(Recipe.recipes) { item in
                                    Button {
                                      print("찍힘")
                                    } label: {
                                        VStack{
                                            Image(item.image)
                                            HStack{
                                                Image(item.userimg)
                                                VStack(alignment: .leading){
                                                    Text(item.name)
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15))
                                                    Text(item.des)
                                                        .foregroundColor(.green).font(.system(size: 15))
                                                }
                                            }
                                 
                                        }.padding(.trailing,10)
                                    }
                                }
                            }
                        }
                    }
                    
                }
            }
            
            
        }.padding(.horizontal)
    }
    
    
    func getEmail() -> String{
        guard let id = UserDefaults.standard.object(forKey: "email") else{
          return ""
        }
        return id as! String
    }
}







struct NaviTopView: View {
    
    var name:String
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: "car.fill")
                .renderingMode(.original)
                .resizable()
                .frame(width: 30, height: 30)
            Text(name).font(.body)
            Spacer()
            Button {
                print("오른쪽 찍힘")
            } label: {
                Image("filter").renderingMode(.original)
            }
        }
    }
}


//MARK: - PreView
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
