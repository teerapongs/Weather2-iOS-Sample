//
//  XMLParserLocation.swift
//  Weather1
//
//  Created by CharuwanRuanmoei on 1/12/16.
//  Copyright © 2016 bananacoding. All rights reserved.
//

import UIKit

class XMLParserLocation: NSObject, NSXMLParserDelegate {
    
    private var parser = NSXMLParser()
    private var element = String()
    var weather = Weather()
    
    init(Url: String) {
        super.init()
        let urlToSend: NSURL = NSURL(string: Url)!
        parser = NSXMLParser(contentsOfURL: urlToSend)!
        parser.delegate = self

        let success: Bool = parser.parse()
        
        if success {
            print("parse success")
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName
        if elementName == "Result"{
            weather = Weather()
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if element == "city" {
            weather.city += string
        }
        else if element == "woeid" {
            weather.woeid += string
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "results" {
            return;
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print("parse failure! error: \(parseError)")
    }
}
