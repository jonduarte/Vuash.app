//
//  About.swift
//  Vuash
//
//  Created by Jonathan Duarte on 31/05/2017.
//  Copyright © 2017 Jonathan Duarte. All rights reserved.
//

import Cocoa

class About: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewDidAppear() {
        // any additional code
        view.window!.styleMask.remove(.resizable)
        view.window!.styleMask.remove(.miniaturizable)
    }
    
    
}
