//
//  ViewController.swift
//  Weather
//
//  Created by Patrick Landin on 12/15/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var city: UITextField!
    
    @IBOutlet weak var weatherMessage: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        var URLString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        var URL = NSURL(string: URLString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(URL!) {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            
            let tempUrlContent : String = urlContent as String
            
//            if (tempUrlContent.bridgeToObjectiveC().containsString("<span class=\"phrase\">") {
            
                var contentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
            
                var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
            
            
                var weatherForecast = newContentArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º") as String
            
            
                dispatch_async(dispatch_get_main_queue()) {
            
                    self.weatherMessage.text = weatherForecast
            
                }
            
            
//            } else {
//            
//            
//                dispatch_async(dispath_get_main_queue()) {
//            
//                    self.weatherMessage.text = "We couldn't find that city. Please try again."
//            
//                }
//            
//            }
            
        }
        
    
        
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

