//
//  XMLParser.swift
//  Weather1
//
//  Created by ton on 1/4/2559 BE.
//  Copyright © 2559 bananacoding. All rights reserved.
//

import UIKit

class XMLParser: NSObject, NSXMLParserDelegate {
    
    private var parser = NSXMLParser()
    private var element = String()
    var weather = Weather()
    
    init(url: String) {
        super.init()
        
        let urlToSend: NSURL = NSURL(string: url)!
        
        parser = NSXMLParser(contentsOfURL: urlToSend)!
        parser.delegate = self
        
        let success: Bool = parser.parse()
        
        if success {
            print("parse success")
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
        element = elementName
        if elementName == "item" {
            weather = Weather()
        }
        
        if elementName == "yweather:condition" {
            weather.descriptionOfConditions = attributeDict["text"]!
            weather.temp = attributeDict["temp"]!
        }
        
        if elementName == "yweather:forecast" {
            var forecast = [String: String]()
            forecast["day"] = attributeDict["day"]!
            forecast["descriptionOfConditions"] = attributeDict["text"]!
            forecast["lowTemp"] = attributeDict["low"]!
            forecast["highTemp"] = attributeDict["high"]!
            
            weather.forecasts.append(forecast)
        }
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if element == "title" {
            weather.title += string
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            return;
        }
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print("parse failure! error: \(parseError)");
    }
}
