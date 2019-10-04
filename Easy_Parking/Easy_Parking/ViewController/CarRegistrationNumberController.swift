//
//  ViewCarRegistationNumberController.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit
import Firebase

var walletData: Double = 23000
var CarNumber = 0;
class CarRegistrationNumberController: UIViewController {
  var ref: DatabaseReference!
  
  var provinceData: [String] = ["กรุงเทพมหานคร", "กระบี่", "กาญจนบุรี", "กำแพงเพชร", "ขอนแก่น", "เชียงราย", "เชียงใหม่", "นครปฐม", "ภูเก็ต", "ลำปาง", "อ่างทอง",]
  
  @IBOutlet weak var provincePicker: UIPickerView!
  @IBOutlet weak var carNumberTextField: UITextField!
  @IBOutlet weak var provinceTextField: UITextField!
  
  @IBOutlet weak var walletNumber: UILabel!
  @IBOutlet weak var moneyAmount: UILabel!
  
  
  @IBAction func tappedRegisterCar(_ sender: Any) {
     CarNumber = CarNumber+1
    if let carProvince = provinceTextField.text, !carProvince.isEmpty, let carNumber = carNumberTextField.text, !carNumber.isEmpty {
      carItemData.append(CarItem(carRegistration: carNumber, carProvince: carProvince))
   
     
      let numcar = "\(CarNumber)"
    self.ref.child("AccountNum").child("AccountCar").child(numcar).setValue(["Plate":carNumber, "province": carProvince])
     
      navigationController?.popViewController(animated: true)
    }
  }
   // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.ref = Database.database().reference()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.provincePicker.isHidden = true
    self.moneyAmount.text = String(format: "%.2f", walletData)
  }
  
}

extension CarRegistrationNumberController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return provinceData.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    self.view.endEditing(true)
    return provinceData[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.provinceTextField.text = self.provinceData[row]
    self.provincePicker.isHidden = true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    self.provincePicker.isHidden = false
    provinceTextField.endEditing(true)
  }
  
}
