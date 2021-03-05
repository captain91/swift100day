//
//  D13ViewController.swift
//  Swift100day
//
//  Created by Shibo Sun on 2021/3/5.
//

import UIKit

class D13ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var longtute: Double
        longtute = 238.388183
        
        var a = 10
        a = a + 1
        a = a - 1
        a = a * a
        var b = 10
        b += 10
        b -= 10
    
        
        var aa = 1.1
        var bb = 2.2
        var c = aa + bb
        c > 3
        c >= 3
        c > 4
        c < 4
        
        var name1 = "Tim McGraw"
        var name2 = "Romeo"
        var both = name1 + " and " + name2
        
        var name = "Tim McGraw"
        name == "Tim McGraw"
        name != "Tim MCgraw"
        var stayOutTooLate = true
//        stayOutTooLate
        !stayOutTooLate

        
        var evenNumbers = [2,4,6,8]
        
        
        var person = [
            "first": "Taylor",
            "middle": "Alison",
            "last": "Swift",
            "month": "December",
            "website": "taylorswift.com"
        ]
        
        var action: String
        var person1 = "hater"
        if person1 == "hater" {
            action = "hate"
        }
        
        var ac: String
        var stayOut = true
        var nothingIn = true
        if stayOut && nothingIn {
            ac = "cruise"
        }
        
        var songs:[Any] = ["Shake it off", "You Belong with me", "Look What You Made Me DO",4]
        for song in songs {
            if song is Int{
                print(song as! Int * 3)
            }else{
                print("\(song) : is a song name")
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
