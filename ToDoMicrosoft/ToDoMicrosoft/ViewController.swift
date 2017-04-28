//
//  ViewController.swift
//  ToDoMicrosoft
//
//  Created by Александр Чапчук on 28/04/2017.
//  Copyright © 2017 Александр Чапчук. All rights reserved.
//

import Cocoa
import WebKit
class ViewController: NSViewController {

    @IBOutlet weak var webView: WebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let targetURL = URL(string: "https://todo.microsoft.com/login")
        let request = URLRequest(url: targetURL!)
        self.webView.mainFrame.load(request)
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




