//
//  DetailViewController.swift
//  Project4
//
//  Created by Carmen Morado on 11/4/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,  WKNavigationDelegate {
    @IBOutlet var webView: WKWebView!
    var selectedWebsite: String?
    //var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = ["apple.com", "hackingwithswift.com"]
    
    override func loadView(){
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let websiteToLoad = selectedWebsite {
            let url = URL(string: "https://" + websiteToLoad)!
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
                

                // Do any additional setup after loading the view.
                
                navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
                
                let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                
                progressView = UIProgressView(progressViewStyle: .default)
                progressView.sizeToFit()
                let progressButton = UIBarButtonItem(customView: progressView)
                
                let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
                let forward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
                let backward = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))

                toolbarItems = [progressButton, spacer, refresh, backward, forward]
                navigationController?.isToolbarHidden = false
                
                webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
            }
            
            @objc func openTapped() {
                let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .actionSheet)
                for website in websites {
                    ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
                }
                ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
                present(ac, animated: true)
            }
            
            func openPage(action: UIAlertAction) {
                let url = URL(string: "https://" + action.title!)!
                webView.load(URLRequest(url: url))
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
                let url = navigationAction.request.url

                if let host = url?.host {
                    for website in websites {
                        if host.contains(website) {
                            decisionHandler(.allow)
                            return
                        }
                    }
                    
                    let prohibited = UIAlertController(title: "Prohibited!", message: "This site is not allowed", preferredStyle: .alert)
                    prohibited.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
                    present(prohibited, animated: true)
                    
                }
                
                decisionHandler(.cancel)
              
            }

        }


