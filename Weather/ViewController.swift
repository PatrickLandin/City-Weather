//
//  ViewController.swift
//  Weather
//
//  Created by Patrick Landin on 12/15/14.
//  Copyright (c) 2014 Patrick Landin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var city: UITextField!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        var URLString = "http://www.weather-forecast.com/locations/" + city.text.stringByReplacingOccurrencesOfString(" ", withString: "") + "/forecasts/latest"
        
        var URL = NSURL(string: URLString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(URL!) {(data, response, error) in
            
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            var contentArray = urlContent!.componentsSeparatedByString("<span class=\"phrase\">")
            
            var newContentArray = contentArray[1].componentsSeparatedByString("</span>")
            
            self.weatherMessage.text = newContentArray[0] as? String
            
        }
        
        task.resume()
        
    }
    
    @IBOutlet weak var weatherMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

