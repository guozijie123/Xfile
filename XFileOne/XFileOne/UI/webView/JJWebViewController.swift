//
//  JJWebViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2023/2/14.
//  基础展示H5 WebView

import UIKit
import WebKit

class JJWebViewController: BaseViewController,WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate{
    
    
    
    
    
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
        configuration.allowsInlineMediaPlayback = true
        let webView = WKWebView(frame: self.view.frame, configuration: configuration)
        configuration.userContentController.add(self, name: "openView")
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
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if message.name == "openView"{

            if let jsonString = message.body as? String,
               let jsonData = jsonString.data(using: .utf8),
               let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any],
               let url = (dic["param"] as? [String: Any])?["url"] as? String {
                self.navigationController?.pushViewController(JJopenBoxViewController(urlStr: url, urlTitle: "开盒大吉"), animated: true)
                
                #warning("来到这里整个支付流程结束，上层页面要回到仓库列表，不是一层一层返回")
                
            } else {
                // Handle error
            }
        }
        
    }
    
    
}
