//
//  MyTableViewController.swift
//  Weather2
//
//  Created by CharuwanRuanmoei on 1/14/2559 BE.
//  Copyright © 2559 CharuwanRuanmoei. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var titleName = String()
    var titleArr = [String]()
    var idArray = [String]()
    var selectedTitle = String()
    
    var idCty = [NSManagedObject]()
    var nameCity = [NSManagedObject]()
    var latitude = String()
    var longitude = String()
    var id: String = ""
    var city :String = ""
    
    @IBOutlet var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    @IBAction func saveTitle(segue:UIStoryboardSegue){
        if segue.identifier == "cityName"{
            let controller: ReceiveLatAndLongController = segue.sourceViewController as! ReceiveLatAndLongController
            titleName = controller.titleName
            
            latitude = controller.latitude
            longitude = controller.longitude
            print(latitude + "&&" + longitude)
            print(titleArr)
            
            let parser = XMLParserLocation(Url: "http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.placefinder%20where%20text=%22\(latitude),\(longitude)%22%20and%20gflags=%22R%22")
           
            let weather: Weather = parser.weather1
            id = weather.woeid
            city = weather.city
        
            idArray.append(id)
            titleArr.append(city)

            }
        }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
            
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArr.count;

    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.titleArr[indexPath.row]
        return cell
    }
        
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
            
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let selectedRow = self.tableView.indexPathsForSelectedRows {
            let showViewController = segue.destinationViewController as! ShowViewController
            let indexPath = selectedRow[0]
            showViewController.idCiry = idArray[indexPath.row]
        }
    
    }
        
}
