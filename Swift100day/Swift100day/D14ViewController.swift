//
//  D14ViewController.swift
//  Swift100day
//
//  Created by Shibo Sun on 2021/3/8.
//

import UIKit

class D14ViewController: UIViewController {
    
    enum WeatherType {
        case sun
        case cloud
        case rain
        case wind(speed: Int)
        case snow
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteAlbum(name: "Faitalg")
        
        printAlbumRelease(name: "fearless", year: 2008)
        printAlbumRelease(name: "Speak Now", year: 2010)
        
        countLettersInString("Hello W")
        
        countLetters(in: "World")
        
        if albumIsTaylor(name: "Red"){
            print("That's one of hers!")
        }else{
            print("Who made that?")
        }
        
//        var status: String?
//        status = getHaterStatus(weather: "rainy")
//        var status1 = getHaterStatus(weather: "rainy")
        
//        if let haterStatus = getHaterStatus(weather: "rainy") {
//            takeHaterAction(status: haterStatus)
//        }
        
        getHaterStatus(weather: .wind(speed: 5))
        
        let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
        let other = Person(clothes: "short skirts", shoes: "high heels")
        
        var taylorCopy = taylor
        taylorCopy.shoes = "flip flops"
        print(taylor)
        print(taylorCopy)
        
        print(taylor.clothes)
        print(other.shoes)
        
        taylor.describe()
        
        
        var ay = Singer(name: "Taylor", age: 25)
        ay.sing()
        // Do any additional setup after loading the view.
    }
    
    class Singer{
        var name: String
        var age: Int
        
        init(name: String, age: Int){
            self.name = name
            self.age = age
        }
        
        func sing(){
            print("La la la la")
        }
    }
    
    class CountrySinger: Singer {
        override func sing() {
            print("Trucks, guitars, and liquor")
        }
    }
    
    class HeavyMetalSinger: Singer{
        var noiseLevel: Int
        init(name: String, age: Int, noiseLevel: Int) {
            self.noiseLevel = noiseLevel
            super.init(name: name, age: age)
        }
        
        override func sing() {
            print("Grrrrr rargh rargh rarrrgh!")
        }
    }
    
    class Person1{
        var clothes: String
        var shoes: String
        
        init(clothes: String, shoes: String) {
            self.clothes = clothes
            self.shoes = shoes
        }
    }
    struct Person {
        var clothes: String
        var shoes: String
        
        func describe(){
            print("I like wearing \(clothes) with \(shoes)")
        }
    }
    
    func favoriteAlbum(name: String){
        print("My favorite is \(name)")
    }
    
    func printAlbumRelease(name: String, year: Int){
        print("\(name) was released in \(year)")
    }
    
    func countLettersInString(_ str: String){
        print("The string \(str) has \(str.count) letters.")
    }
    
    func countLetters(in string: String){
        print("The string \(string) has \(string.count) letters.")
    }
    
    func albumIsTaylor(name: String) -> Bool{
        if name == "Taylor Swift" { return true }
        if name == "Feraless" { return true }
        if name == "Speak Now" { return true }
        if name == "Red" { return true }
        if name == "1989" {return true }
        
        return false
    }
    
    func getHaterStatus(weather: WeatherType) -> String? {
        switch weather {
        case .sun:
            return nil
        case .wind(let speed) where speed < 10:
            return "meh"
        case .cloud, .wind:
            return "dislike"
        case .rain:
            return "hate"
        case .snow:
            return "Like"
        }
    }
    
    func takeHaterAction(status: String){
        if status == "Hate" {
            print("Hating")
        }
    }

}
