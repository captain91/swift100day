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
        
        
        func square(number: Int) -> Int{
            print(number * number)
            return number * number
        }
        
       let s = square(number: 8)
        
        func doMoreMath() -> Int{
            5 + 10
        }
        print(doMoreMath())
        
        func getUser() -> (first:String, last: String){
            (first: "Taylor", last: "Swift")
        }
        let user = getUser()
        print(user.first)
        
        func sayHello(to name: String){
            print("hello, \(name)")
        }
        sayHello(to: "Taylor Swift")
        
        func greet(_ person: String){
            print("Hello ,\(person)")
        }
        
        greet("Taylor")
        
        
        func greetd(_ person: String, nicely: Bool = true){
            if nicely == true {
                print("Hello, \(person)!")
            }else {
                print("Oh no, it's \(person) again...")
            }
        }
        
        greetd("Taylor")
        greetd("Taylor", nicely: false)
        
        func squarePro(numbers: Int...){
            for number in numbers{
                print("\(number) squared is \(number * number)")
            }
        }
        
        squarePro(numbers: 1,3,5,7,9,10)
        
        enum PasswordError: Error {
            case obvious
        }
        
        func checkPassword(_ password: String) throws -> Bool{
            if password == "password"{
                throw PasswordError.obvious
            }
            return true
        }
        
        do {
            try checkPassword("password")
            print("That password is good!")
        }catch {
            print("You can't use that password.")
        }
        
        func doubleInPlace(number: inout Int){
            number *= 2
        }
        var myNum = 10
        doubleInPlace(number: &myNum)
        print(myNum)
        
        let driving = { (palce:String) in
            print("I'm driving in my car")
        }
        driving("London")
        
//        var signAutograph(to name: String) = {
//            print("To \(name), my #1 fan")
//        }
//
//        signAutograph(to: "Lisa")
        
        let learnSwift = {
            print("Closures are like functions")
        }
        learnSwift()
        
        var cleanRoom = { (name: String) in
            print("I'm cleaning the \(name)")
        }
        
        cleanRoom("kitchen")
        
        
        let drivingWithReturn = { (place: String) -> String in
            return "I'm going to \(place) in my car!"
        }
        
        let message = drivingWithReturn("London")
        print(message)
        
        func payment() -> Bool {
            return true
        }
        
        print("--------分割线--------")
        let drivingP = {
            print("I'm driving in my car to ping")
        }
        func travel(action: () -> Void){
            print("I'm getting ready to go.")
            action()
            print("I arrived!")
        }
        travel(action: drivingP)
        travel {
            print("I'm new car")
        }
        
        func animate(duration: Double, animations: ()->Void){
            print("Starting a \(duration) second animation..")
            animations()
        }
        
        animate(duration: 3) {
            print("Fade out the image")
        }
        
        func goCamping(then action: () -> Void){
            print("We're going camping!")
            action()
        }
        
        goCamping {
            print("hhh")
        }
        
        func travelParameters(action: (String) -> Void){
            print("I'm getting ready to go.")
            action("London")
            print("I arrived!")
        }
        travelParameters { (place: String) in
            print("I'm going to \(place) in my car!")
        }
        
        func fix(item: String, payBill: (Int) -> Void){
            print("I've fixed your \(item)")
            payBill(450)
        }
        fix(item: "roof") { (bill: Int) in
            print("You want $\(bill) for that? Outrageous!")
        }
        
        func travelReturn(action: (String) -> String){
            print("I'm getting ready to go.")
            let description = action("London")
            print(description)
            print("I arrived!")
        }
        
        travelReturn { (place: String) -> String in
            return "I'm going to \(place) in my BYD."
        }
        travelReturn{
            "I'm going to \($0) im my byd"
        }
//        travelReturn { (place) -> String in
//            return "I'm going to \(place) in my Car!"
//        }
        
        func reduce(_ values: [Int], using closure: (Int,Int) -> Int) -> Int{
            var current = values[0]
            for value in values[1...]{
                current = closure(current,value)
            }
            return current
        }
        
        let numbersArr = [10, 20, 30]
        let sum = reduce(numbersArr) { (runningTotal, next) -> Int in
            runningTotal + next
        }
        print(sum)
        
        let sum2 = reduce(numbersArr, using: *)
        print(sum2)
        
        print("--------------sp-------------")
        func travelTwo(action: (String, Int) -> String){
            print("I'm getting ready to go.")
            let description = action("London", 60)
            print(description)
            print("I arrived!")
        }
        
        travelTwo {
            "I'm going to \($0) at \($1) miles per hour."
        }
        
        func travelReturnClosure() -> (String)->Void{
            var counter = 1
            print("counter \(counter)")
            return {
                print("\(counter) I'm going to \($0)")
                counter += 1
            }
        }
        let backResult = travelReturnClosure()
        backResult("London")
        backResult("HangKong")
        travelReturnClosure()("HangKong")
        
        print(Int.random(in: 1...10))
        
        func getRandomNumber() -> Int {
            Int.random(in: 1...10)
        }
        
        func makeRandomGenerator() -> () -> Int{
            let function = { Int.random(in: 1...10)}
            return function
        }
        print(makeRandomGenerator())
        
        
        func makeRandomNuberGenerator() -> () -> Int{
            var previousNumber = 0
            return {
                var newNumber: Int
                repeat {
                    newNumber = Int.random(in: 1...3)
                }while newNumber == previousNumber
                previousNumber = newNumber
                return newNumber
            }
        }
        let g = makeRandomNuberGenerator()
        for _ in 1...10{
            print(".... \(g())")
        }
        
        func findTallest() -> (String, Double) -> (String) {
            var tallestName = ""
            var tallestHeight = 0.0
            return {
                    if $1 > tallestHeight {
                        tallestName = $0
                        tallestHeight = $1
                    }
                    return tallestName
                }
        }
        
        func visitPlaces() -> (String) -> Void {
            var places = [String: Int]()
            return {
                places[$0, default: 0] += 1
                let timesVisited = places[$0, default: 0]
                print("Number of times I've visited \($0): \(timesVisited).")
            }
        }
        let visit = visitPlaces()
        visit("London")
        visit("New York")
        visit("London")
        
        //8day
        var tennis = Sport(name: "Tennis", isOlympicSport: true)
        print(tennis.name)
        tennis.name = "Lawn tennis"
        print(tennis.name)
        
        let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
        print(chessBoxing.olympicStatus)
        
        struct Progress {
            var task: String
            var amount: Int{
                didSet {
                    print("\(task) is now \(amount)% complete")
                }
            }
        }
        var progress = Progress(task: "Loading data", amount: 0)
        progress.amount = 30
        progress.amount = 80
        progress.amount = 100
        
        let london = City(population: 9_000_000)
        let taxes = london.collectTaxes()
        print(taxes)
        
        var person = Person(name: "Ed")
        print(person.name)
        person.makeAnonymous()
        print(person.name)
        
        let string = "Do or do not, there is no try."
        print(string.count)
        print(string.hasPrefix("Do"))
        print(string.uppercased())
        print(string.sorted())
        
        var toys = ["Woody"]
        toys.append("Buzz")
        toys.append("Zipe")
        print(toys.firstIndex(of: "Buzz1"))
        print(toys.sorted())
        toys.remove(at: 0)
        
        
//        let poppy = Dog(name: "Poppy", breed: "Poodle")
        
        let poodle = Poodle()
        poodle.makeNoise()
        
        
        for _ in 1...3 {
            let person = PersonOne()
            person.printGreeting()
        }
        
        
        
        let day11 = D11ViewController()
        day11.showView()
        
        let day12 = D12ViewController()
        day12.viewDidLoad()
        
        let day13 = D13ViewController()
        day13.viewDidLoad()
        
        let day14and15 = D14and15ViewController()
        day14and15.viewDidLoad()
    }
}

struct Student {
    var name: String
    var bestFriend: String
    init(name: String, bestFriend: String) {
        print("Enrolling \(name) in class...")
        self.name = name
        self.bestFriend = bestFriend
    }
}

struct User {
    var username: String
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String{
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        }else {
            return "\(name) is not an Olympic sport"
        }
    }
}

struct City {
    var population: Int
    
    func collectTaxes() -> Int{
        return population * 1000
    }
}

struct Person {
    var name: String
    
    mutating func makeAnonymous(){
        name = "Anonymous"
    }
}


class Dog {
//    var name: String
//    var breed: String
    
//    init(name: String,breed: String) {
//        self.name = name
//        self.breed = breed
//    }
    
    func makeNoise(){
        print("Woof!")
    }
}

class Poodle: Dog {
    
    override func makeNoise() {
        print("Yip!")
    }
}

class PersonOne {
    var name = "John Doe"
    init(){
        print("\(name) is alive!")
    }
    
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}
