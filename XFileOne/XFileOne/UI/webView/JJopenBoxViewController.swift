//
//  JJopenBoxViewController.swift
//  XFileOne
//
//  Created by Douglas on 2023/3/22.
//

import UIKit
import WebKit

class JJopenBoxViewController: BaseViewController{
    
    
    
    
    
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
//        configuration.userContentController.add(self, name: "openView")
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
