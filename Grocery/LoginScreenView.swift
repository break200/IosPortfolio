//
//  LoginScreenView.swift
//  Grocery
//
//  Created by break200 on 2022/11/10.
//

import SwiftUI

struct LoginScreenView: View {
    
      @Environment(\.presentationMode)
      var presentationMode: Binding

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
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                        Button(action: {
                           self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrowshape.backward.fill")
                                .padding()
                        Spacer()
                    }
                }
                Spacer()
                
            }
        }.navigationBarTitle("")
         .navigationBarHidden(false)
         .navigationBarBackButtonHidden(true)
//         .navigationBarItems(leading:btnBack)
        
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
