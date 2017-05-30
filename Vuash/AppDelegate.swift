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
    var myWindowController: NSWindowController!

    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem?.image = NSImage(named: "send_button")
        statusItem?.action = #selector(AppDelegate.showViewController)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func showViewController() {
        // show main view controller
        myWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "initialWindow") as! NSWindowController
        myWindowController.showWindow(self)
        //        [myController showWindow:self]; // show the window
    
    }
    
}

