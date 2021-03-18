//
//  ViewController.swift
//  Project4-6
//
//  Created by Shibo Sun on 2021/3/18.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareListTapped))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addShoppingList))
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List",for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    @objc func addShoppingList(){
        let ac = UIAlertController(title: "Enter Goods Name", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let name = ac?.textFields?[0].text else { return }
            self?.submit(name)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ name: String){
        if name.isEmpty { return }
        
        let errorTitle: String
        let errorMessage: String
        
        let lowerName = name.lowercased()
        if isOriginal(name: lowerName) {
            shoppingList.insert(lowerName, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            return
        }else{
            errorTitle = "Name already exit"
            errorMessage = "不需要重复添加"
        }
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok",style: .default))
        present(ac, animated: true)
    }
    
    func isOriginal(name: String) -> Bool{
        return !shoppingList.contains(name)
    }

    
    @objc func shareListTapped(){
        let listString = shoppingList.joined(separator: "\n")
        let ac = UIActivityViewController(activityItems: [listString], applicationActivities: [])
        ac.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        present(ac, animated: true)
    }
}

