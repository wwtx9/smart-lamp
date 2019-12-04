//
//  DetailedViewController.swift
//  smartLamp
//
//  Created by Wang Weihan on 12/4/19.
//  Copyright © 2019 Wang Weihan. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var light_off_on_label: UILabel!
    var clientSocket:GCDAsyncSocket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func on_action(_ sender: Any) {
        light_off_on_label.text = "On"
        let serviceStr: NSMutableString = NSMutableString()
        serviceStr.append("1")
        clientSocket?.write(serviceStr.data(using: String.Encoding.utf8.rawValue)!, withTimeout: -1, tag: 0)
    }
    
    @IBAction func off_action(_ sender: Any) {
        light_off_on_label.text = "Off"
        let serviceStr: NSMutableString = NSMutableString()
        serviceStr.append("0")
        clientSocket?.write(serviceStr.data(using: String.Encoding.utf8.rawValue)!, withTimeout: -1, tag: 0)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    ————————————————
    版权声明：本文为CSDN博主「ghostedlead」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
    原文链接：https://blog.csdn.net/ghostedlead/article/details/79082559
}
