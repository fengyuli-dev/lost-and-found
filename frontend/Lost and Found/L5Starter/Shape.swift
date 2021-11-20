//
//  Shape.swift
//  L5Starter
//
//  Created by Amy Chin Siu Huang on 10/25/21.
//

import Foundation
import UIKit

class Shape {
    var imageName: String
    var isSelected: Bool

    init (imageName: String) {
        self.imageName = imageName
        self.isSelected = false
    }

    func getImage() -> UIImage {
        let imageName = isSelected ? "\(imageName)invert" : imageName
        guard let image = UIImage(named: imageName) else { return UIImage() }
        return image
    }
}
