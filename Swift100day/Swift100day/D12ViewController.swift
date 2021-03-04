//
//  D12ViewController.swift
//  Swift100day
//
//  Created by Shibo Sun on 2021/3/4.
//

import UIKit

class D12ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("-------day 12--------")
        var age: Int? = nil
        age = 30
        
        var name: String? = nil
        name = "Taylor Swift"
        print(name?.count)
        
        if let unwrapped = name {
            print("\(unwrapped.count) letters")
        }else{
            print("Missing name.")
        }
        
        if let username = getUserName() {
            print("Username is \(username)")
        }else{
            print("No username")
        }
        
        var bestScore:Int? = nil
        bestScore = 101
        if bestScore != nil {
            print("You got a high score!")
        }else{
            print("Better luck next time")
        }
        
//        let tableHeight: Double? = 100
//        if tableHeight > 85.0 {
//            print("the table is to high.")
//        }
        
        if isLongEnough("Mario Odyssey"){
            print("Let's play that!")
        }
        
        let str = "4"
        let num = Int(str)
        print(num)
        
        let age1: Int! = nil
        
        let user1 = username1(for: 14) ?? "Anonymous"
        print(user1)
        
        let names = ["John", "Paul","George","Ringo"]
        let beatle = names.first?.uppercased()
        print(beatle)
        
        let lengthOfLast = names.last?.count
        
        let songs:[String]? = [String]()
        let finalSong = songs?.last?.uppercased()
        
//        do {
//            try checkPassword("password")
//            print("That password is good!")
//        }catch {
//            print("You can't use that password.")
//        }
        
        if let result = try? checkPassword("password"){
            print("Result was \(result)")
        }else{
            print("D'oh.")
        }
        
        let tim = Employee(username: "TimC", password: "apple")
        let craig = Employee(username: "CraigF", password: "harljladskjl20")
        print("tim \(tim),craigf \(craig)")
        
        var hsaForcePowers = "false"
        let convertedHasForcePowers = Bool(hsaForcePowers)
        print(convertedHasForcePowers)
        
        
        let pets = [Fish12(), Dog12(), Fish12(), Dog12()]
        for pet in pets {
            if let dog = pet as? Dog12{
                dog.makeNoise()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    struct Employee {
        var username: String
        var password: String
        
        init?(username: String, password: String){
            guard password.count >= 8 else { return nil }
            guard password.lowercased() != "passwrod" else { return nil }
            
            self.username = username
            self.password = password
        }
    }
    
    enum PasswordError: Error {
        case obvious
    }
    
    func checkPassword(_ password: String) throws -> Bool{
        if password == "password"{
            throw PasswordError.obvious
        }
        return true
    }
    
    
    func username1(for id: Int) -> String?{
        if id == 1{
            return "Taylor Swift"
        }else{
            return nil
        }
    }
    
    func getUserName() -> String?{
        "Taylor"
    }
    
    func greet(_ name: String?){
        guard let unwrapped = name else {
            print("You didn't provide a name!")
            return
        }
        print("Hello, \(unwrapped)")
    }
    
    func getMeaningOfLife() -> Int? {
        42
    }
    func printMeaningOfLife(){
//        if let name = getMeaningOfLife(){
//            print(name)
//        }
        
        guard let name = getMeaningOfLife() else {
            return
        }
        
        print(name)
    }
    
    func isLongEnough(_ string: String?) -> Bool{
        guard let string = string else { return false }
        if string.count >= 8 {
            return true
        }else{
            return false
        }
    }
    
    func username(for id: Int?) -> String {
        guard let id = id else {
            return "nil"
        }
        
        if id == 1989 {
            return "Taylor Swift"
        }else{
            return "nil"
        }
    }
}

class Animal12 {
    var name = "National Museum"
}
class Fish12: Animal12{}

class Dog12: Animal12{
    func makeNoise(){
        print("Woof!")
    }
}
