//
//  ViewController.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

var carItemData: [CarItem] = [
  CarItem(carRegistration: "นย1121", carProvince: "กรุงเทพฯ"),
  CarItem(carRegistration: "บห5333", carProvince: "นครปฐม"),
  CarItem(carRegistration: "รน2343", carProvince: "สุโขทัย")
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
    if segue.identifier == "showDetail",
      let viewController = segue.destination as? CarRegistrationDetail,
      let carItem = sender as? CarItem {
      viewController.carTitle = carItem.carRegistration
    }
  }
  
}
extension ViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90.0//Choose your custom row height //fix.
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if carItemData.indices.contains(indexPath.row){
      let carItem = carItemData[indexPath.row]
      self.performSegue(withIdentifier: "showDetail", sender: carItem)
    }
  }

  //swipe to delete
  
}
extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return carItemData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableViewControl.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? CarListTableViewCell else{
      return UITableViewCell()
    }
    cell.btn_ShowQRCode = {
      self.performSegue(withIdentifier: "pageQR", sender: Any?.self)
    }
    cell.carProvince.text = carItemData[indexPath.row].carProvince
    cell.carNumber.text = carItemData[indexPath.row].carRegistration
  return cell
  }
}

