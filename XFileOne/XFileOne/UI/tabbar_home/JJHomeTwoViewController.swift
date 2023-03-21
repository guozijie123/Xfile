//
//  JJHomeTwoViewController.swift
//  XFileOne
//
//  Created by Douglas on 2023/3/20.
//

import Foundation

import UIKit
import WebKit

class JJHomeTwoViewController: BaseViewController,WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate{
    
    
    
    
    
    var webView: WKWebView!
    
    var urlStr: String? // 地址
    var urltitle: String? // 导航栏标题

    
    required init(urlStr: String, urlTitle: String) {
        self.urlStr = urlStr
        self.urltitle = urlTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //加载前端webview
   override func viewDidLoad() {
       super.viewDidLoad()
       title = self.urltitle

       initSubViews()
       
       if ((self.urlStr) != nil) {
           self.webView.load(URLRequest.init(url: URL(string: self.urlStr!)!))
       }
   }
    
    override func initSubViews() {
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = WKUserContentController()
        configuration.userContentController.add(self, name: "placeOrder")
        let webView = WKWebView(frame: self.view.frame, configuration: configuration)
        
        
        webView.scrollView.bounces = true
        webView.scrollView.alwaysBounceVertical = true
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.webView = webView
        
        
        
    }
    
    // 加载 url
    func loadUrl(url:String) {
        self.urlStr = url
        self.webView.load(URLRequest.init(url: URL(string: self.urlStr!)!))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if message.name == "placeOrder"{
//            print("接收链接push打开下层页面来打开webview %@",message.body)
            if let jsonString = message.body as? String,
               let jsonData = jsonString.data(using: .utf8),
               let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any],
               let boxid = (dic["param"] as? [String: Any])?["id"] as? String {
               print("%@",boxid)
               self.navigationController?.pushViewController(JJOrderConfirmViewController(boxid: boxid), animated: true)
            } else {
                // Handle error
            }
        }
        
    }
    
    
    
}
