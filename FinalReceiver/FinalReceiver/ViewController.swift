//
//  ViewController.swift
//  FinalReceiver
//
//  Created by Morris Arroyo on 2017-12-08.
//  Copyright © 2017 Morris Arroyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()		
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.displayLaunchDetails), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func displayLaunchDetails() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        label.text = delegate.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

