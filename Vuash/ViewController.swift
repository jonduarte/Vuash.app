//
//  ViewController.swift
//  Vuash
//
//  Created by Jonathan Duarte on 24/05/2017.
//  Copyright © 2017 Jonathan Duarte. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        makeHttpRequest()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func makeHttpRequest() {
        let request = NSMutableURLRequest(url: NSURL(string: "http://lvh.me:3000")! as URL)
        request.httpMethod = "POST"
        let postString = "message[data]=example.com"
        request.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            guard error == nil && data != nil else{
                print("error")
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200{
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            let responseString = String(data: data!, encoding: String.Encoding.utf8)
            //print("responseString = \(String(describing: responseString))")
            print(self.findVuashLink(source: responseString!))
        }
        task.resume()
        
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

