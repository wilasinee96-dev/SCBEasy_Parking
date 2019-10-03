//
//  CarRegistrationDetail.swift
//  Easy_Parking
//
//  Created by pathomphong charoenwichianchay on 3/10/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//


import UIKit
class CarRegistrationDetail: UIViewController {
  var carTitle: String = ""
  
  
  func setTitle(title: String) {
    navigationItem.title = title
  }
  
  override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         setTitle(title: carTitle)
     }
  
  
}
