//
//  ShowViewController.swift
//  Weather2
//
//  Created by CharuwanRuanmoei on 1/14/2559 BE.
//  Copyright © 2559 CharuwanRuanmoei. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    var idCiry: String = "12756339"
  
    @IBOutlet weak var textField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let parser = XMLParser(url: "https://weather.yahooapis.com/forecastrss?w=\(idCiry)&u=c")
        
        let weather: Weather = parser.weather
        var string = String()
        string = "\(weather.title)\n\n"
        
        string += "Current Conditions: \(weather.descriptionOfConditions), \(weather.temp)C\n\n"
        string += "forecast:\n"
        for forecast in weather.forecasts {
            let day = forecast["day"] as! String
            let descriptionOfConditions = forecast["descriptionOfConditions"] as! String
            let highTemp = forecast["highTemp"] as! String
            let lowTemp = forecast["lowTemp"] as! String
            
            string += "\(day) - \(descriptionOfConditions). High: \(highTemp) Low: \(lowTemp)\n"
        }
        
        textField.text = string

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
