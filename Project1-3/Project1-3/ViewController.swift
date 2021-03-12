//
//  ViewController.swift
//  Project1-3
//
//  Created by Shibo Sun on 2021/3/12.
//

import UIKit

class ViewController: UITableViewController {

    var countries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Countries Flag"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
//        let fm = FileManager.default
//        let path = Bundle.main.resourcePath!
//        let items = try! fm.contentsOfDirectory(atPath: path)
//
//        for item in items {
//            print(item)
//            if item.hasPrefix("png"){
//                countries.append(item)
//            }
//        }
        
        countries = countries.sorted()
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectCountry = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

