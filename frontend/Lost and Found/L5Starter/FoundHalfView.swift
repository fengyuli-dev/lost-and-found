//
//  File.swift
//  Lost and Found
//
//  Created by Haoxuan Zou on 11/21/21.
//

import Foundation
import UIKit
class FoundHalfView : UIPresentationController{
    override var frameOfPresentedViewInContainerView: CGRect{
        return CGRect(origin: CGPoint(x: 0, y: self.containerView!.frame.height/2), size: CGSize(width: self.containerView!.frame.width, height: self.containerView!.frame.height/2))
    }
}
