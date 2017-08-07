//
//  Appliction.swift
//  PocketCasts
//
//  Created by Benny Lach on 07.08.17.
//  Copyright © 2017 DevKiste. All rights reserved.
//

import Cocoa

enum MediaKey: Int {
    case playPause = 16
    case forward = 19
    case backward = 20
}

class Appliction: NSApplication {
    override func sendEvent(_ event: NSEvent) {
        if event.type == .systemDefined && event.subtype.rawValue == 8 {
            // 16 == PlayPause 20 == Backward 19 == Forward
            if let key = MediaKey(rawValue: ((event.data1 & 0xFFFF0000) >> 16)) {
                let keyFlags = (event.data1 & 0x0000FFFF)
                // Get the key state. 0xA is KeyDown, OxB is KeyUp
                let keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA
                let keyRepeat = (keyFlags & 0x1) == 1
                
                if !keyRepeat && keyState {
                    InjectionController.shared.handleMediaKey(key: key)
                }
            }
        } else {
            super.sendEvent(event)
        }
    }
    
    private func handleMediaKey(key: MediaKey) {
        switch key {
        case .playPause:
            print("playPause key pressed")
        case .forward:
            print("fast forward pressed")
        case .backward:
            print("fast backwards pressed")
        }
    }
}
