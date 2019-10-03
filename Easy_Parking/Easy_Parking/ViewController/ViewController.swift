//
//  ViewController.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

var list :[String] = ["hello","test2","test3"]
var provinceList: [String] = ["bangkok","Non","nakon"]
var carItemData: [CarItem] = [
  CarItem(carRegistration: "1121", carProvince: "bangkok"),
  CarItem(carRegistration: "3333", carProvince: "ddok"),
  CarItem(carRegistration: "3333", carProvince: "ddok")
]
class ViewController: UIViewController {

  @IBOutlet weak var tableViewControl: UITableView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      //Set the navigation back button
      self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

  }
  
  override func viewDidAppear(_ animated: Bool) {
    tableViewControl.reloadData()
  }
  
  @IBAction func Btn_ForAddCar(_ sender: Any) {
    performSegue(withIdentifier: "pageRegister", sender: Any?.self)
    
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
  }
  
  
  
}
extension ViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90.0//Choose your custom row height //fix.
  }
  
}
extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableViewControl.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? CarListTableViewCell else{
      return UITableViewCell()
    }
    cell.btn_ShowQRCode = {
      self.performSegue(withIdentifier: "pageQR", sender: Any?.self)
    }
    cell.carProvince.text = provinceList[indexPath.row]
    cell.carNumber.text = list[indexPath.row]
    
//    cell.carProvince.text = carItemData[indexPath.row].carProvince
//    cell.carNumber.text = carItemData[indexPath.row].carRegistration
  return cell
  }
  
  
  
}

