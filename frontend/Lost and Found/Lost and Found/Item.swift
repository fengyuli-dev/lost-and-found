//
//  Item.swift
//  LostandFound
//
//  Created by Vivian on 11/20/21.
//
import Foundation
import UIKit

class Item:Codable{
    var id:Int
    var name: String
    var location: String
    var time: String?
    var description: String
    var user: Int
//    var pics: UIImage
    
    init(id:Int, name: String, location: String, time: String?, description: String,user: Int) {
        print("trying Item")
        self.name = name
        self.location = location
        self.time = time
        self.description=description
        self.user=user
//        self.pics=pics
        self.id = id
    }
    
}
