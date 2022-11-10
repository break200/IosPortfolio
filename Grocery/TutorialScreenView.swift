//
//  TutorialScreenView.swift
//  Grocery
//
//  Created by break200 on 2022/11/10.
//

import SwiftUI

struct TutorialScreenView: View {
    
    @State private var pageIndex = 0
    private let pages:[Page] = Page.pageViews
    private let dotAppearance = UIPageControl.appearance()
    
    @State var isShowView = false
    
    var body: some View {
        
        
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack{
                    Spacer()
                    VStack(spacing: 10) {
                        Image("\(page.imageUrl)")
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .cornerRadius(30)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding()
                        Text(page.name)
                            .font(.title)
                        Text(page.description)
                            .font(.subheadline)
                            .frame(width:250)
                    }
                    Spacer()
                    if page == pages.last {
                        Button {
                            print("처음으로")
                            pageToZero()
                        } label: {
                            Text("처음으로")
                                .foregroundColor(.red)
                        }
                        Spacer()
                        
                        Button {
                          gotoLogin()
                        } label: {
                            Text("로그인")
                                       .foregroundColor(Color.RGB(red: 52, green: 152, blue: 219))
                        }
                                                   
                        
                        
//                        NavigationLink(destination: LoginScreenView()) {
////
//                        }
                    }else{
                        Button {
                            print("다음으로")
                            incrementPage()
                        } label: {
                            Text("다음으로")
                                .foregroundColor(Color.RGB(red: 52, green: 152, blue: 219))
                        }
                    }
                    Spacer()
                }.tag(page.tag)
            }
        }.animation(.easeInOut, value: pageIndex)
         .indexViewStyle(.page(backgroundDisplayMode: .interactive))
         .tabViewStyle(PageTabViewStyle())
         .onAppear {
              dotAppearance.currentPageIndicatorTintColor = .black
              dotAppearance.pageIndicatorTintColor = .gray
         }
        
        
        
        
       
    }
    
    ////////
    ///
    ///
        ///
        func gotoLogin(){
            let window = UIApplication
                        .shared
                        .connectedScenes
                        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                        .first { $0.isKeyWindow }

                    window?.rootViewController = UIHostingController(rootView: LoginScreenView())
                    window?.makeKeyAndVisible()
        }
    
    func incrementPage(){
        pageIndex += 1
    }
    
    func pageToZero(){
        pageIndex = 0
    }
    
}

struct TutorialScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialScreenView()
    }
}
