//
//  SCBEasyController.swift
//  Easy_Parking
//
//  Created by pathomphong charoenwichianchay on 29/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import Foundation
import UIKit

class SCBEasyController: UIViewController {
  
  override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      // Hide the navigation bar on the this view controller
      self.navigationController?.setNavigationBarHidden(true, animated: animated)
      
      //Set the navigation back button
      self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)

      // Show the navigation bar on other view controllers
      self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
}
