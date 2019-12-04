//
//  ViewController.swift
//  smartLamp
//
//  Created by Wang Weihan on 12/4/19.
//  Copyright © 2019 Wang Weihan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GCDAsyncSocketDelegate {

    let serverPort:UInt16 = 8888
    var clientSocket = GCDAsyncSocket()
    
    
    @IBOutlet weak var serveripInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func conBtnClick(_ sender: Any) {
        if serveripInput.text?.isEmpty == false{
            clientSocket.delegate = self
            clientSocket.delegateQueue = DispatchQueue.global()
            do {
                try clientSocket.connect(toHost: serveripInput.text!, onPort: serverPort)
                print("Connect Successfully! Lol")
            } catch {
                print("try connect error: \(error)")
            }
        }else{
            print("input can not empty!! haha")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "send", let destination = segue.destination as? DetailedViewController{
            destination.clientSocket = self.clientSocket
        }
    }

}

