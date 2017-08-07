//
//  InjectionController.swift
//  PocketCasts
//
//  Created by Benny Lach on 07.08.17.
//  Copyright © 2017 DevKiste. All rights reserved.
//

import Foundation
import WebKit

class InjectionController: NSObject {
    static let shared = InjectionController()
    
    private let events = ["mediaPlayer"]
    
    private override init() {}
}

// MARK: - WebView Builder
extension InjectionController {
    func getWebView() -> WKWebView? {
        if let url = Bundle.main.url(forResource: "inject", withExtension: "js"),
            let jsString = try? String(contentsOf: url) {
            
            let script = WKUserScript(source: jsString, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
            
            let controller = WKUserContentController()
            controller.addUserScript(script)
            
            for e in events {
                controller.add(self, name: e)
            }
            
            let config = WKWebViewConfiguration()
            config.userContentController = controller
            
            let webview = WKWebView(frame: .zero, configuration: config)
            
            return webview
        }
        return nil
    }
}

// MARK: - WKScriptMessageHandler Delegate
extension InjectionController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("Did receive msg from js: ", message.body)
    }
}
