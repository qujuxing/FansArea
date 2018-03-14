//
//  WebViewController.swift
//  FansArea
//
//  Created by 瞿炬星 on 2018/3/14.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    @IBOutlet weak var wkWebView: WKWebView!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://baidu.com") {
            let request = URLRequest(url: url)
//            webView.loadRequest(request)
            wkWebView.load(request)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
