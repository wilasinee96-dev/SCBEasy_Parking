//
//  ViewQRController.swift
//  Easy_Parking
//
//  Created by Z64me on 28/9/2562 BE.
//  Copyright © 2562 Z64me. All rights reserved.
//

import UIKit
import Firebase

class ViewQRController: UIViewController {

    var ref: DatabaseReference!

    var datetime1 = ""
    var datetime2 = ""

    func getCurrentData1(){
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "HH:mm:ss"
        let str = formatter.string(from: Date())
        datetime1 = str
        print(str)
    }
    
    func getCurrentData2(){
        let formatter2 = DateFormatter()
        formatter2.timeStyle = .medium
        formatter2.dateFormat = "HH:mm:ss"
        let str2 = formatter2.string(from: Date())
        datetime2 = str2
        print(str2)
       }
    
    func findDateDiff(time1Str: String, time2Str: String) -> String {
        let timeformatter = DateFormatter()
        timeformatter.dateFormat = "HH:mm:ss"

        guard let time1 = timeformatter.date(from: time1Str),
            let time2 = timeformatter.date(from: time2Str) else { return "" }

        //You can directly use from here if you have two dates
        print("\(datetime1) + \(datetime2)")
        let interval = time2.timeIntervalSince(time1)
        let hour = interval / 3600;
        let minute = interval.truncatingRemainder(dividingBy: 3600) / 60
        let intervalInt = Int(interval)
        print("minute \(minute)")
        let min = (hour*60)
        print("min \(min)")
//        let mins = min+minute
//        print("mins \(mins)")
        //return "\(intervalInt < 0 ? "-" : "+") \(Int(hour)) Hours \(Int(minute)) Minutes"
        return "\(min)"
    }
    
    func getHours(mins: String) -> Int {
        var hours = 0
        let sum = (mins as NSString).integerValue
        if(sum%60 == 0){
            hours = sum/60
        }else{
            hours = (sum/60) + 1
        }
        print("price \(hours)")
        return hours
    }
    
    func getPriceParagon(hours: Int) -> Int {
        var price = 0
        let hour = hours-2
        if(hour==0){
            price = 0
        }else if(hour>0 && hours<5){
            price = hour*30
        }else if(hour>=5){
            price = 120
            let sum = hour-4
            price = (sum*60) + price
        }
        print("\(price)")
        return price
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentData1()
        getCurrentData2()
        let result = (findDateDiff(time1Str: "10:10:00", time2Str: "13:50:00"))
        let prices = (getHours(mins: result))
        getPriceParagon(hours: prices)
        // Do any additional setup after loading the view.
        self.ref = Database.database().reference()
           // self.ref.child("AccountNum").child("PlateNum").child("Place").setValue(["Timein": "15:10:10", "Timeout": "15:30:10", "Price": "0", "Place": "สยามพารากอน"])
        for i in 1...10 {
            self.ref.child("AccountNum").child("PlateNum").child("Bill\(i)").setValue(["Timein": "15:10:10", "Timeout": datetime1, "Price": "10", "Place": "สยามพารากอน"])
        }
            
            //let PlateNum = Auth.auth().currentUser?.uid
        //    ref.child("AccountNum").child("PlateNum").child("Place").child("Time").observeSingleEvent(of: .value, with: { (snapshot) in
        //      // Get user value
        //      let value = snapshot.value as? NSDictionary
        //      let price = value?["Price"] as? String ?? ""
        //      //let user = User(username: username)
        //        print("value \(value)")
        //        print("price \(price)")
        //      // ...
        //      }) { (error) in
        //        print(error.localizedDescription)
        //    }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
