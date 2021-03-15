//
//  ViewController.swift
//  Project4
//
//  Created by Shibo Sun on 2021/3/15.
//

import UIKit
import WebKit

class ViewController: UITableViewController{
    var websites = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Websites"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        websites += ["apple.com", "google.com", "baidu.com", "hackingwithswift.com"]
                
    }
    
    @objc func addTapped(){
        let vc = UIAlertController(title: "Website", message: nil, preferredStyle: .alert)
        vc.addTextField { (textField) in
            textField.placeholder = "Please input URL"
        }
        vc.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        vc.addAction(UIAlertAction(title: "Add", style: .default, handler: { (alert) in
            let textField = vc.textFields![0]
            if textField.text!.count > 0 {
                self.websites.append(textField.text!)
                self.tableView.reloadData()
            }
        }))
        present(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WebCell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "WebView") as? WebViewController{
            vc.webUrl = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
   
}

