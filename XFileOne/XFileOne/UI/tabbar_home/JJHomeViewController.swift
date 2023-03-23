//
//  JJHomeViewController.swift
//  XFileOne
//
//  Created by 郭嘉俊 on 2022/8/31.
//

import UIKit
import WebKit

class JJHomeViewController: BaseViewController,WKScriptMessageHandler,WKNavigationDelegate,WKUIDelegate {

    var webView: WKWebView!
    
    let urlStr = "https://mohe.goldenb.cc/#/home"
    
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
        configuration.userContentController.add(self, name: "openView")
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

        print("加载完成")
        
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if message.name == "openView"{
            print("接收链接push打开下层页面来打开webview %@",message.body)
            if let jsonString = message.body as? String,
               let jsonData = jsonString.data(using: .utf8),
               let dic = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any],
               let url = (dic["param"] as? [String: Any])?["url"] as? String {
               self.navigationController?.pushViewController(JJHomeTwoViewController(urlStr: url, urlTitle: "商品详情"), animated: true)
            } else {
                // Handle error
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension JJHomeViewController {
    

}


