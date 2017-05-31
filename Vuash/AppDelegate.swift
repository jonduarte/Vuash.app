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

    var myWindowController: NSWindowController!
    let popover = NSPopover()
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        
        statusItem.image = NSImage(named: "send_button")
        
        if let button = statusItem.button {
            button.target = self
            button.action = #selector(self.showViewController)
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
            
            let storyboard = NSStoryboard(name: "Main", bundle: nil)
            popover.contentViewController = storyboard.instantiateController(withIdentifier: "ViewController") as! ViewController
            popover.behavior = NSPopoverBehavior.transient
        }
        
    }
    
    func quit() {
        NSApplication.shared().terminate(self)
    }
    
    func about() {
        popover.contentViewController?.performSegue(withIdentifier: "showAbout", sender: self)
    }
            

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func showViewController() {
        let event = NSApp.currentEvent!
        
        if event.type == NSEventType.rightMouseUp {
            closePopover(sender: nil)
            
            let menu = NSMenu()
            
            menu.addItem(NSMenuItem(title: "About", action: #selector(self.about), keyEquivalent: ""))
            menu.addItem(NSMenuItem.separator())
            menu.addItem(NSMenuItem(title: "Quit", action: #selector(self.quit), keyEquivalent: ""))
            
            
            statusItem.menu = menu
            statusItem.popUpMenu(menu)
            
            // This is critical, otherwise clicks won't be processed again
            statusItem.menu = nil
        } else {
            togglePopover(sender: nil)
        }
    
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
    }
    
    
}

