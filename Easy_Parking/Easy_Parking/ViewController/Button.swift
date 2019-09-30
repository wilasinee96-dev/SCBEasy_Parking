//
//  Button.swift
//  Easy_Parking
//
//  Created by pathomphong charoenwichianchay on 30/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit
@IBDesignable
class Button: UIButton {
  @IBInspectable public var borderColor:UIColor? {
         didSet {
             layer.borderColor = borderColor?.cgColor
         }
     }
     @IBInspectable public var borderWidth:CGFloat = 0 {
         didSet {
         layer.borderWidth = borderWidth
         }
     }
     @IBInspectable public var cornerRadius:CGFloat {
         get {
             return layer.cornerRadius
         }
         set {
             layer.cornerRadius = newValue
             layer.masksToBounds = newValue > 0
         }
     }

}
