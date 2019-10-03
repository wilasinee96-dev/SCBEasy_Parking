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
  var carProvince: String = ""
  
  @IBOutlet weak var carNumberLabel: UILabel!
  
  @IBOutlet weak var provinceLabel: UILabel!
  @IBOutlet weak var moneyAmount: UILabel!
  
  func setTitle(title: String) {
    navigationItem.title = title
  }
  
  func setCarRegistration(carRegisNumber: String, carProvince: String) {
    carNumberLabel.text = carRegisNumber
    provinceLabel.text = carProvince
  }
  
  func setWalletAmount(amount: Double) {
     moneyAmount.text = String(format: "%.2f", walletData)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setTitle(title: carTitle)
    setCarRegistration(carRegisNumber: carTitle, carProvince: carProvince)
    setWalletAmount(amount: walletData)
     }
  
  
}
