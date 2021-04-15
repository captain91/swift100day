//
//  ViewController.swift
//  Project18
//
//  Created by Shibo Sun on 2021/4/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1, 2, 3, 4, 5, separator: "-")
//        print("Some message", terminator: "")
        
//        assert(myReallySLowMethod() == true, "The slow method returened false, which is a bad thing.")
        assert(1 == 1, "Math failure!")
//        assert(1 == 2, "Math failure!")
        
        for i in 1...100 {
            print("Got number \(i)")
        }
    }


}

