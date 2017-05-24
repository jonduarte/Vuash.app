//
//  AppDelegate.swift
//  Vuash
//
//  Created by Jonathan Duarte on 24/05/2017.
//  Copyright © 2017 Jonathan Duarte. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem : NSStatusItem? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem?.image = NSImage(named: "send_button")
        statusItem?.action = #selector(AppDelegate.makeHttpRequest)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func makeHttpRequest () {
        print("Me!")
    }


}

