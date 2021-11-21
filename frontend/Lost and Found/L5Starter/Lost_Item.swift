//
//  Lost_Item.swift
//  LostandFound
//
//  Created by Vivian on 11/21/21.
//

import Foundation
import UIKit

class Lost_Item{
    var objectName: String
    var location: String
    var time: String
    var contact: String
    var descrip: String
    var pics: UIImage
    
    init(objectName: String, location: String, time: String, descrip: String, contact: String, pics: UIImage) {
        
        self.objectName = objectName
        self.location = location
        self.time = time
        self.contact=contact
        self.descrip = descrip
        self.pics=pics
    }
    
}
