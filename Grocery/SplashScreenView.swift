//
//  SplashScreenView.swift
//  Grocery
//
//  Created by break200 on 2022/11/10.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive = false
    @State private var size = 0.3
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            ContentView()
        }else{
            VStack{
                VStack{
                 Image(systemName: "hare.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                 Text("Break 200")
                        .font(.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.black.opacity(0.8))
                        
                }.scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
