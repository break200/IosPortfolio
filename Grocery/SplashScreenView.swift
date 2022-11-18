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
        
        if isLoginConfirm() {
           ContentView()
        }else{
            if isActive {
                //앱을 최초실행
                TutorialScreenView()
            }else{
                ZStack {
                    //백그라운드 색깔적용
                    Color.RGB(red: 52, green: 152, blue: 219)
                    VStack{
                        VStack{
                         Image(systemName: "hare.fill")
                                .font(.system(size: 80))
                                .foregroundColor(.red)
                         Text("포토폴리오")
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
                .ignoresSafeArea()
            }
        }
    }
    
    private func isLoginConfirm() -> Bool {
        guard let _ = UserDefaults.standard.object(forKey: "email") else {
            return false
        }
        return true
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
