//
//  11ViewController.swift
//  Swift100day
//
//  Created by Shibo Sun on 2021/3/3.
//

import UIKit

class D11ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    func showView(){
        let m = Movie(name: "Alita", actors: ["AJ","AU","99"])
        buy(m)
        
        let sq = 23
        print(sq.squared())
//        sq.isEven
        
        let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
        let beatles = Set(["John", "Paul", "George", "Ringo"])
        
        pythons.summarize()
        beatles.summarize()
    }
    
    func displayID(thing: Identifiable){
        print("My ID is \(thing.id)")
    }
    
    func buy(_ item: Purchaseable){
        print("I'm buying \(item.name)")
    }
}

protocol Identifiable {
    var id: String { get set }
}

struct User11: Identifiable {
    var id: String
}

protocol Purchaseable {
    var name: String { get set }
    
}

struct Movie: Purchaseable {
    var name: String
    
    var actors:[String]
}

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

protocol Computer {
    var price: Double { get set }
    var weight: Int { get set }
    var cpu: String { get set }
    var memory: Int { get set }
    var storage: Int { get set }
}

extension Int {
    func squared() -> Int {
        return self * self
    }
    
    var isEven: Bool{
        return self % 2 == 0
    }
}

extension Collection {
    func summarize(){
        print("Thers ar \(count) of us:")
        for name in self {
            print(name)
        }
    }
}
