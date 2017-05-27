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
    var vuashLink = ""
    @IBOutlet var txtVuashLink: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtVuashLink.stringValue = vuashLink
    }
    
}
