//
//  ViewCarRegistationNumberController.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class CarRegistationNumberController: UIViewController {
  
  @IBOutlet weak var provincePicker: UIPickerView!
  
  @IBOutlet weak var provinceTextField: UITextField!
  var provinceData: [String] = ["กรุงเทพฯ", "นครปฐม", "นนทบุรี", "จันทบุรี", "นครราชสีมา", "ขอนแก่น"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.provincePicker.isHidden = true
  }
  
}

extension CarRegistationNumberController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    provinceData.count
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