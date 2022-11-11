//
//  LoginScreenView.swift
//  Grocery
//
//  Created by break200 on 2022/11/10.
//

import SwiftUI

struct LoginScreenView: View {
    
//      @Environment(\.presentationMode)
//      var presentationMode: Binding

//      var btnBack : some View { Button(action: {
//            self.presentationMode.wrappedValue.dismiss()
//      }) {
//         HStack {
//            Image("ic_back") // set image here
//                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
//                Text("<")
//            }
//        }
//    }
//    @Environment(\.dismiss) private var dismiss
    
    @State private var isShowView = false
    
    @State private var email = ""
    @State private var pass = ""
    
    var body: some View {
        
        if isShowView {
//            TutorialScreenView()
            ContentView()
        }else{
//            VStack{
//                HStack {
//                        Button(action: {
//                            self.isShowView.toggle()
//                        }) {
//                            Image(systemName: "arrowshape.backward.fill")
//                                .padding()
//                        Spacer()
//                    }
//                }
//                Spacer()
//            }
            
            ZStack{
                Color.black
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.red,.white.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(135))
                    .offset(x: 0, y: -400)
                VStack(spacing: 20) {
                    Text("로그인")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .offset(x: -100, y: -100)
                        
                    TextField("Email", text: $email)
                        .foregroundStyle(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    
                    TextField("pass", text: $pass)
                        .foregroundStyle(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: pass.isEmpty) {
                            Text("Pass")
                                .foregroundColor(.white)
                                .bold()
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    Button {
                        if let errorMessage = self.validView() {
                           print(errorMessage)
                           return
                        }
                        self.isShowView.toggle()
                    } label: {
                       Text("Sign up")
                            .bold()
                            .frame(width: 200, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius:20.0,style: .continuous)
                                    .fill(.linearGradient(colors: [.red,.white.opacity(0.5)], startPoint: .top, endPoint: .bottomTrailing))
                            )
                    }
                    
                    Button {
                        print("회원가입")
                    } label: {
                       Text("Already have an account? Login")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top)
                            .offset(y:200)
                    }

                    
                }.frame(width: 350)
                
            }.ignoresSafeArea()
        }
    }
    
    private func validView() -> String? {
         if email.isEmpty {
             return "Email is empty"
         }
         
         if !self.isValidEmail(email) {
             return "Email is invalid"
         }
         
         if pass.isEmpty {
             return "Password is empty"
         }
         
//         if self.password.count < 8 {
//             return "Password should be 8 character long"
//         }
         
         // Do same like other validation as per needed
         
         return nil
     }
    
    //이메일 체크
    private func isValidEmail(_ email: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPred.evaluate(with: email)
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
            .previewDevice("iPhone 14 Pro Max")
        LoginScreenView()
            .previewDevice("iPhone 14 Pro")
        LoginScreenView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
