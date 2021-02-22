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
        
        let weeks = 465 / 7
        print("There are \(weeks) weeks until the event.")
        
        let number = 49
        let isMultiple = number.isMultiple(of: 7)
        print(isMultiple)
        
        var re = 2 + 2 + 1.0
        var kk:Double = 2.0 + 2
        var ss = 56
        ss += 4
        
        let firstName = "Paul"
        let secondName = "Sophie"
        let firstAge = 40
        let secondAge = 10
        
        print(firstName == secondName)
        print(firstName != secondName)
        print(firstName < secondName)
        print(firstName >= secondName)
        
        print(firstAge == secondAge)
        print(firstAge != secondAge)
        print(firstAge < secondAge)
        print(firstAge >= secondAge)
        
        
        let weather = "sunny"
        
        switch weather {
        case "sunny":
            print("Bring an umbrella")
            fallthrough
        case "snow":
            print("Wrap up warm")
            fallthrough
        case "sunny1":
            print("Wear sunscreen")
        default:
            print("Enjoy your day!")
        }
        
        let count = 1...10
        for number in count {
            print("Number is \(number)")
        }
        
        let albums = ["Red", "1989", "Reputataion"]
//        albums.shuffled()
        for album in albums {
            print("\(album) is on Apple Music")
        }
        
        for _ in 1...4{
            print("for loops")
        }
        
        var number1 = 1
        while number1 <= 20 {
            print(number1)
            number1 += 1
        }
        print("Ready or not, here I come!")
        
        var b: Int = 10
        while b > 0 {
            b -= 2
            if b % 2 == 0 {
                print("\(b) is an even number.")
            }
        }
        
        var averageScore = 2.5
        while averageScore < 15.0 {
            averageScore += 2.5
            print("The average score is \(averageScore)")
        }
        
        var speed = 50
        while speed <= 55 {
            speed += 1
            print("Accelerating to \(speed)")
        }
        
        var nn = 1
        repeat {
            print(nn)
            nn += 1
        }while nn <= 10
        
        
        let nns = [1,2,3,4,5]
        var random: [Int]
        
        repeat {
            print("random")
            random = nns.shuffled()
        }while random == nns
        
        let numbers1 = [1, 2, 3, 4, 5]
        var random1 = numbers1.shuffled()

        while random1 == numbers1 {
            random1 = numbers1.shuffled()
            print("while")
        }
        
        outerLoop: for i in 1...10{
            for j in 1...10{
                let product = i * j
                print("\(i) * \(j) is \(product)")
                
                if product == 50 {
                    print("It's a bullseye!")
                    break outerLoop
                }
            }
            print("outerLoop")
        }
        let options = ["up", "down", "left", "right"]
        let secretCombination = ["up", "up", "right"]
        outerLoop: for option1 in options {
            for option2 in options {
                for option3 in options {
                    print("In loop")
                    let attempt = [option1, option2, option3]

                    if attempt == secretCombination {
                        print("The combination is \(attempt)!")
                        break outerLoop
                    }
                }
            }
        }
        
        for i in 1...10 {
            if i % 2 == 1{
                continue
            }
            print(i)
        }
        
        let fibonacci = [1, 1, 2, 3, 5, 8, 13, 21]
        var position = 0
        while position <= 7 {
            let value = fibonacci[position]
            position += 1
            if value < 2 {
               continue
            }
            print("Fibonacci number \(position) is \(value)")
        }
        
        var counting = 0
        while counting <= 20 {
            counting += 1
            if counting > 5 {
                continue
            }
            print("\(counting)...")
        }
        print("Ready or not, here I come!")
        // Do any additional setup after loading the view.
    }


}

