//
//  ViewController.swift
//  Project12
//
//  Created by Shibo Sun on 2021/3/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseFaceID")
        defaults.set(CGFloat.pi, forKey: "Pi")
        
        defaults.set("Shibo", forKey: "Name")
        defaults.set(Date(), forKey: "LastRun")
        
        let array = ["Hell", "World"]
        defaults.set(array, forKey: "SavedArray")
        
        let dict = ["Name": "Paul", "Country": "CN"]
        defaults.set(dict, forKey: "SavedDictionary")
        
        
        let savedInteger = defaults.integer(forKey: "Age")
        let savedBoolen = defaults.bool(forKey: "UseFaceID")
        
        let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
        let savedDictionary = defaults.object(forKey: "SavedDictionary") as? [String: String] ?? [String : String]()
        
//        let array2 = defaults.dici
    }


}

