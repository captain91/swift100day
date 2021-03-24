//
//  ViewController.swift
//  Project7-9
//
//  Created by Shibo Sun on 2021/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    var clubLabel: UILabel!
    var answerLabel: UILabel!
    var currentAnswer: UITextField!
    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()
    
    var userLetters = [String]()
    
    var score = 0
    var level = 1
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        clubLabel = UILabel()
        clubLabel.translatesAutoresizingMaskIntoConstraints = false
        clubLabel.font = .systemFont(ofSize: 24)
        clubLabel.text = "CLUE"
        clubLabel.numberOfLines = 0
        view.addSubview(clubLabel)
        
        answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.font = .systemFont(ofSize: 24)
        answerLabel.text = "ANSWER"
        answerLabel.textAlignment = .center
        view.addSubview(answerLabel)
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.layer.borderWidth = 1
        buttonsView.layer.borderColor = UIColor.gray.cgColor
        buttonsView.layer.cornerRadius = 10
        view.addSubview(buttonsView)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            clubLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor,constant: 20),
            clubLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10),
            clubLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            answerLabel.topAnchor.constraint(equalTo: clubLabel.bottomAnchor,constant: 10),
            answerLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant: 10),
            answerLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant: 10),
            buttonsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
        ])
        
        let width = 40
        let height = 40
        
        for row in 0..<4 {
            for column in 0..<5{
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = .systemFont(ofSize: 36)
                letterButton.setTitle("A", for: .normal)
                
                let frame = CGRect(x: column * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                
                buttonsView.addSubview(letterButton)
            }
        }
        
//        scoreLabel.backgroundColor = .orange
//        clubLabel.backgroundColor = .yellow
//        answerLabel.backgroundColor = .blue
//        buttonsView.backgroundColor = .red
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let results = ["Paul", "Sophie", "Lottie", "Andrew", "John"]
//
//        for (place, result) in results.enumerated() {
//            print("\(place + 1). \(result)")
//        }
//        DispatchQueue.global().async { [weak self] in
//            // do background work
//            DispatchQueue.main.async {
//                // do main thread work
//            }
//        }
//        let word = "RHYTHM"
//        var usedLetters = ["R", "T"]
//        var promptWord = ""
//
//        for letter in word {
//            let strLetter = String(letter)
//
//            if usedLetters.contains(strLetter) {
//                promptWord += strLetter
//            } else {
//                promptWord += "?"
//            }
//        }
//
//        print(promptWord)

        
        loadLevel()
    }

    
    func loadLevel(){
        
        var answers = [String]()
        var clues = [String]()

        if let levelFileUrl = Bundle.main.url(forResource: "level\(level)", withExtension: "txt"){
            if let levelContents = try? String(contentsOf: levelFileUrl){
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
                for (index, line) in lines.enumerated() {
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    let word = answer.replacingOccurrences(of: "|", with: "")
                    answers.append(word)
                    clues.append("\(index + 1). \(clue)")
                }
            }
        }
        
        clubLabel.text = clues[0]
        var ltStr = ""
        for _ in answers[0] {
            ltStr += "?"
        }
        answerLabel.text = ltStr
    }

}

