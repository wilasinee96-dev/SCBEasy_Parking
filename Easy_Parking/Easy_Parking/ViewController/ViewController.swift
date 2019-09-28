//
//  ViewController.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  @IBOutlet weak var tableViewControl: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  @IBAction func Btn_ForAddCar(_ sender: Any) {
    performSegue(withIdentifier: "pageRegister", sender: Any?.self)
    
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
  }
  
  
  
}
extension ViewController: UITableViewDelegate{
  
  
}
extension ViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableViewControl.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? CarListTableViewCell else{
      return UITableViewCell()
    }
    cell.btn_ShowQRCode = {
      self.performSegue(withIdentifier: "pageQR", sender: Any?.self)
    }
  return cell
  }
  
  
  
}

