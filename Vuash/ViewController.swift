//
//  ViewController.swift
//  Vuash
//
//  Created by Jonathan Duarte on 24/05/2017.
//  Copyright © 2017 Jonathan Duarte. All rights reserved.
//

import Cocoa
import Alamofire

class ViewController: NSViewController {
    
    let AES = CryptoJS.AES()
    var shareLink = ""
    @IBOutlet var btn: NSButton!
    @IBOutlet var scrollView: NSScrollView!
    @IBOutlet var message: NSTextView!
    
    @IBAction func vuash(_ sender: Any) {
        makeHttpRequest(message: message.textStorage?.string ?? "")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.borderType = NSBorderType.noBorder
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let vc : MessageCreated = segue.destinationController as! MessageCreated
        vc.vuashLink = shareLink
    }
    
    func makeHttpRequest(message: String) {
        let request     = "http://www.vua.sh"
        let secret      = UUID().uuidString.lowercased()
        let encrypted   = AES.encrypt(message, password: secret)
        
        let parameters: Parameters = [
            "message": [
                "data": encrypted
            ]
        ]
        
        Alamofire.request(request, method: .post, parameters: parameters).responseData { response in
            let body        = String(data: response.data!, encoding: .utf8)
            let vuashLink   = self.findVuashLink(source: body!)
            let link        = "\(vuashLink)#\(secret)"
            
            DispatchQueue.main.async(execute: {
                //self.linkTextField.stringValue = link
                self.message.string = ""
                self.shareLink = link
                self.performSegue(withIdentifier: "segueMessageCreated", sender: self)
            })
            
        }
    }
    
    func findVuashLink(source: String) -> String {
        let linkRegexPattern = "\\$\\(document\\)\\.trigger\\('hash', '(.*)'"
        
        let linkRegex = try! NSRegularExpression(pattern: linkRegexPattern, options: .caseInsensitive)
        let matches = linkRegex.matches(in: source, range: NSMakeRange(0, source.utf16.count))
        
        let links = matches.map { result -> String in
            let hrefRange = result.rangeAt(1)
            let start = String.UTF16Index(hrefRange.location)
            let end = String.UTF16Index(hrefRange.location + hrefRange.length)
            
            return String(source.utf16[start..<end])!
        }
        return links.first!
    }
    
    

}

