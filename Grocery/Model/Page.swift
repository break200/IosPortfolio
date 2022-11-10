//
//  Page.swift
//  Grocery
//
//  Created by break200 on 2022/11/11.
//

import Foundation


struct Page:Identifiable,Equatable {
    let id = UUID()
    var name:String
    var description:String
    var imageUrl:String
    var tag:Int
    

    static let pageViews = [
        Page(name: "Welcome to Default App!", description: "The best app to get stuff done on an app.", imageUrl: "cowork", tag: 0),
        Page(name: "Meet new people!", description: "The perfect place to meet new people so you can meet new people!", imageUrl: "work", tag: 1),
        Page(name: "Edit your face", description: "Don't like your face? Well then edit your face with our edit-face tool!", imageUrl: "website", tag: 2),
    ]
}
