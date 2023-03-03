//
//  JJHomeViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit
import WebKit

class JJHomeViewController: BaseViewController,WKNavigationDelegate {

    var webView: WKWebView!
    
    let urlStr = "https://mohe.goldenb.cc/#/home"
//    let urlStr = "https://vip.edusihong.com/index"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vhl_navBarHide = true
        
        initSubViews()
        
        self.webView.load(URLRequest.init(url: URL(string: self.urlStr)!))
    }
    
    override func initSubViews() {

        let bg = UIImageView(image: UIImage(named: "user_background"))
        bg.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        view.addSubview(bg)
        
        
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = WKUserContentController()

        let webView = WKWebView(frame: self.view.frame, configuration: configuration)
        webView.scrollView.bounces = true
        webView.scrollView.alwaysBounceVertical = true
        webView.navigationDelegate = self
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.webView = webView
    }
    
//    代理
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error)
    }
    
    

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.body)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension JJHomeViewController {
    

}


