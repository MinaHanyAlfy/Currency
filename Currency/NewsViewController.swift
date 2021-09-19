//
//  NewsViewController.swift
//  Currency
//
//  Created by Mina Hany on 7/2/21.
//

import UIKit
import WebKit

class NewsViewController: UIViewController,WKUIDelegate {
    @IBOutlet weak var importNewsBtn: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var newsWKView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string:"https://win1withus.com/del/news")
        let myRequest = URLRequest(url: myURL!)
        newsWKView.uiDelegate = self
        newsWKView.load(myRequest)

    }
}
