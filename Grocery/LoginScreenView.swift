//
//  LoginScreenView.swift
//  Grocery
//
//  Created by break200 on 2022/11/10.
//

import SwiftUI


enum LoginType {
    case Login;
    case Main;
    case Back;
}

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
    
//    @State private var isShowView = false
    @State private var type:LoginType = .Login
    
    @State private var email = ""
    @State private var pass = ""
    
    @State private var isEmailConfirm = false
    @State private var isPassConfirm = false
    
    var body: some View {
        
        switch type {
        case .Login:
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
                        }.onChange(of: email) { newValue in
                            print("\(newValue)")
                            //email 값 체크 할수 있음
                            if isValidEmail(newValue) {
                               print("메일체크완료")
                               isEmailConfirm = true
                            }else{
                                isEmailConfirm = false
                            }
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
                        }.onChange(of: pass) { newValue in
                            print("\(newValue)")
                            //ㅔㅁ 값 체크 할수 있음
                            
                            if isValidPass(newValue){
                                print("패스워드8자이상")
                                isPassConfirm = true
                            }else{
                                isPassConfirm = false
                            }
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    Button {
                        if isEmailConfirm && isPassConfirm {
                            
                            UserDefaults.standard.set(pass, forKey: "pass")
                            UserDefaults.standard.set(email, forKey: "email")
                            
                           self.type = .Main
                        }
                    } label: {
                       if isEmailConfirm && isPassConfirm {
                           Text("확인")
                                .bold()
                                .frame(width: 200, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius:20.0,style: .continuous)
                                        .fill(.linearGradient(colors: [.red,.white.opacity(0.5)], startPoint: .top, endPoint: .bottomTrailing))
                                )
                       }else{
                           Text("Sign up")
                                .bold()
                                .frame(width: 200, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius:20.0,style: .continuous)
                                        .fill(.linearGradient(colors: [.red,.white.opacity(0.5)], startPoint: .top, endPoint: .bottomTrailing))
                                )
                       }
                    }
                    Button {
                        print("회원가입")
                        self.type = .Back
                    } label: {
                       Text("Already have an account? Login")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top)
//                            .offset(y:200)
                    }
                }.frame(width: 350)
                
            }.ignoresSafeArea()
        case .Main:
            ContentView()
        case .Back:
            TutorialScreenView()
        }
    }
    
    //이메일 체크
    private func isValidEmail(_ email: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          return emailPred.evaluate(with: email)
    }
    
    
    private func isValidPass(_ pass: String) -> Bool {
         if pass.count < 8 {
             return false
         }else{
             return true
         }
    }
    
    
    //이메일 및 패스워드 채크
//    private func
    
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
