//
//  JJWebViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/14.
//  基础展示H5 WebView

import UIKit
import WebKit

class JJWebViewController: BaseViewController{
    
    
    
    
    
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
    
    
    
    
    
}
