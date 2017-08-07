//
//  AppDelegate.swift
//  PocketCasts
//
//  Created by Benny Lach on 07.08.17.
//  Copyright © 2017 DevKiste. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared.keyWindow?.title = "Pocket Casts for Mac"
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

}

