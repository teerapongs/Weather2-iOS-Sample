//
//  XMLParserLocation.swift
//  Weather1
//
//  Created by CharuwanRuanmoei on 1/12/16.
//  Copyright © 2016 bananacoding. All rights reserved.
//

import UIKit

class XMLParserLocation: NSObject, NSXMLParserDelegate {
    
    private var parser1 = NSXMLParser()
    private var element1 = String()
    var weather1 = Weather()

    
    init(Url: String) {
        super.init()
        let urlToSend: NSURL = NSURL(string: Url)!
        parser1 = NSXMLParser(contentsOfURL: urlToSend)!
        parser1.delegate = self

        let success: Bool = parser1.parse()
        
        if success {
            print("parse success")
        }
   
        
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element1 = elementName
  
        if elementName == "Result"{
            weather1 = Weather()
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if element1 == "city" {
            weather1.city += string
            print(weather1.city)
        }
        else if element1 == "woeid" {
            weather1.woeid += string
            print(weather1.woeid)
        }
       
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "results" {
            return;
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print("parse failure! error: \(parseError)");
        
    }

}
