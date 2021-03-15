//
//  WebViewController.swift
//  Project4
//
//  Created by Shibo Sun on 2021/3/15.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    var webUrl: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        let goBack = UIBarButtonItem(title:"Back", style:.plain, target: webView, action: #selector(webView.goBack))
        let goForward = UIBarButtonItem(title: "Froward", style: .plain, target: webView, action: #selector(webView.goForward))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [goBack,goForward, progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        if let url = webUrl {
            let url = URL(string: "https://" + url)!
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
       
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//        let url = navigationAction.request.url
//
//        if let host = url?.host {
//            for website in websites {
//                if host.contains(website){
                    decisionHandler(.allow)
//                    return
////                }else{
////                    let vc = UIAlertController(title: "URL NOT ALLOW", message: nil, preferredStyle: .alert)
////                    vc.addAction(UIAlertAction(title: "OK", style: .cancel))
////                    present(vc, animated: true)
//                }
//            }
//        }
        
//        decisionHandler(.cancel)
    }
    
}
