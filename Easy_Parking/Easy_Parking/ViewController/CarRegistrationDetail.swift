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
//    let final = carRegisNumber.pairs.joined(separator: ":")
//    print(final)
    let carNumberSpace = carRegisNumber.inserting(separator: "  ", every: 3)
    carNumberLabel.text = carNumberSpace
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

extension StringProtocol where Self: RangeReplaceableCollection {
    mutating func insert(separator: Self, every n: Int) {
        for index in indices.reversed() where index != startIndex &&
            distance(from: startIndex, to: index) % n == 0 {
            insert(contentsOf: separator, at: index)
        }
    }

    func inserting(separator: Self, every n: Int) -> Self {
        var string = self
        string.insert(separator: separator, every: n)
        return string
    }
}
