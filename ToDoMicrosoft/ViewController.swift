//
//  ViewController.swift
//  ToDoMincrosoft
//
//  Created by Александр Чапчук on 27/04/2017.
//  Copyright © 2017 Александр Чапчук. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    
    @IBOutlet var webKit: WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let targetURL = URL(string: "https://todo.microsoft.com/login")
        let request = URLRequest(url: targetURL!)
        self.webKit.mainFrame.load(request)
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        
            if let cookies = HTTPCookieStorage.shared.cookies {
                for cookie in cookies {
                    NSLog("\(cookie)")
                }
            }
            
            let storage = HTTPCookieStorage.shared
            for cookie in storage.cookies! {
                storage.deleteCookie(cookie)
            }
        }
    }


}

