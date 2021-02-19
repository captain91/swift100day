//
//  ViewController.swift
//  Swift100day
//
//  Created by Shibo Sun on 2021/2/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var str = "Hello World!"
        print(str)
        str = "I'm string"
        print(str)
        
        var favoriteShow = "orange is the New Black"
        favoriteShow = "The Good Place"
        favoriteShow = "doctor Who"
        print(favoriteShow)
        
        var meaingOfLife = 38_000_124
        print(meaingOfLife)
        
        var str1 = """
        This goes \
        over multiple \
        lines
        """
        print(str1)
        
        var myInt = 1
        var myDouble = 1.0
//        var count = myInt + myDouble
        var score = 85
        var str2 = "Your score was \(score)"
        print(str2)
        
        let album: String = "Reputation"
        let year: Int = 1989
        let height: Double = 1.78
        let taylorRocks: Bool = true
        
        let colors = Set(["red","green","blue"])
        print(colors)
        
        var name = (first:"Taylor", last:"Swift")
        print(name.0,name.last)
        
        let heights = [
            "Talor Swift": 1.78,
            "Ed Sheeran": 1.73
        ]
        print(heights["Talor Swift"])
        print(heights["Mr Liu",default: 1.70])
        
        var teams = [String: String]()
        teams["Pual"] = "Red"
        
        var results = [Int]()
        var words = Set<String>()
        var numbers = Set<Int>()
        
        enum Result{
            case success
            case failure
        }
        print(Result.success)
        
        enum Activity{
            case bored
            case running(destinnation:String)
            case talking(topic: String)
            case singing(volume: Int)
        }
        
        let talking = Activity.talking(topic: "football")
        print(talking)
        
        enum Planet: Int{
            case mercury
            case venus
            case earth
            case mars
        }
        
        // Do any additional setup after loading the view.
    }


}

