//
//  ViewController.swift
//  FinalSender
//
//  Created by Morris Arroyo on 2017-12-08.
//  Copyright © 2017 Morris Arroyo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var alert = UIAlertController(title: "Alert", message: "Options", preferredStyle: UIAlertControllerStyle.alert)
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    @IBOutlet weak var text: UITextView!
   
    @IBAction func openAlert(_ sender: Any) {
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        alert.addAction(UIAlertAction(title: "Speak", style: .default, handler: { action in
            self.myUtterance = AVSpeechUtterance(string: self.text.text)
            self.myUtterance.rate = 0.5
            self.synth.speak(self.myUtterance)
            print ("speak")
        }))
        alert.addAction(UIAlertAction(title: "Open", style: .default, handler: { action in
            let url = NSURLComponents(string: "receiver://")
            url?.queryItems = [URLQueryItem(name:"text", value:self.text.text)]
            if UIApplication.shared.canOpenURL((url?.url)!) {
                print(url?.queryItems![0])
                print(url?.url)
                UIApplication.shared.open((url?.url)!, completionHandler: nil)
            } else if let itunesUrl = NSURL(string: "https://itunes.apple.com/itunes-link-to-app"), UIApplication.shared.canOpenURL(itunesUrl as URL) {
                UIApplication.shared.open(itunesUrl as URL, completionHandler: nil)
            }
            print ("open")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            print("cancel")
        }))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

