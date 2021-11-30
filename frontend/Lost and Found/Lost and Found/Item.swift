//
//  Item.swift
//  LostandFound
//
//  Created by Vivian on 11/20/21.
//
import Foundation
import UIKit

class Item{
    var objectName: String
    var location: String
    var time: String
    var note: String
    var contact: String
//    var contact_phone: String
    var pics: UIImage
    
    init(objectName: String, location: String, time: String, note: String,contact:String,pics: UIImage) {
        self.objectName = objectName
        self.location = location
        self.time = time
        self.note=note
        self.contact=contact
//        self.contact_name=contact_name
//        self.contact_phone=contact_phone
        self.pics=pics
    }
    
}
