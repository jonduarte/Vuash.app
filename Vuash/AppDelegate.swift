//
//  AppDelegate.swift
//  Vuash
//
//  Created by Jonathan Duarte on 24/05/2017.
//  Copyright © 2017 Jonathan Duarte. All rights reserved.
//

import Cocoa
import RNCryptor


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem : NSStatusItem? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
        statusItem?.image = NSImage(named: "send_button")
        statusItem?.action = #selector(AppDelegate.makeHttpRequest)
        encryptData()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func makeHttpRequest () {
        print("Me!")
    }
    
    func encryptData () {
        let AES = CryptoJS.AES()
        
        // Basic AES encryption
        let encrypted = AES.encrypt("Secret message", password: "password123")
        print(encrypted)
        let decrypted = AES.decrypt(encrypted, password: "password123")
        print(decrypted)
        
    }
}

