//
//  MessageCreated.swift
//  
//
//  Created by Jonathan Duarte on 27/05/2017.
//
//

import Cocoa

class MessageCreated: NSViewController {

    @IBOutlet var imageView: NSImageView!
    @IBOutlet var txtVuashLink: NSTextField!
    
    var vuashLink = ""
    
    @IBAction func dismiss(_ sender: Any) {
        dismissViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtVuashLink.stringValue = vuashLink
    }
}
