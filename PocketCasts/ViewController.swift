//
//  ViewController.swift
//  PocketCasts
//
//  Created by Benny Lach on 07.08.17.
//  Copyright © 2017 DevKiste. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWebView()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

// MARK: - Webview Builder
extension ViewController {
    private func addWebView() {
        if let webView = InjectionController.shared.getWebView() {
            view.addSubview(webView)
            
            addWebViewConstraints(webView: webView)
            
            let req = URLRequest(url: Constants.url)
            webView.load(req)
        } else {
            print("Failed to load webview")
        }
    }
    
    private func addWebViewConstraints(webView: NSView) {
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: webView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: self.view,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 0)
        
        let right = NSLayoutConstraint(item: webView,
                                       attribute: .trailing,
                                       relatedBy: .equal,
                                       toItem: self.view,
                                       attribute: .trailing,
                                       multiplier: 1.0,
                                       constant: 0)
        
        let bottom = NSLayoutConstraint(item: webView,
                                        attribute: .bottom,
                                        relatedBy: .greaterThanOrEqual,
                                        toItem: self.view,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: 0)
        
        let left = NSLayoutConstraint(item: webView,
                                      attribute: .leading,
                                      relatedBy: .equal,
                                      toItem: self.view,
                                      attribute: .leading,
                                      multiplier: 1.0,
                                      constant: 0)
        
        NSLayoutConstraint.activate([top, right, bottom, left])
    }
}

