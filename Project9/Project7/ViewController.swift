//
//  ViewController.swift
//  Project7
//
//  Created by Shibo Sun on 2021/3/19.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var searchPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchResults))
        
//        performSelector(inBackground: #selector(fetchJson), with: nil)
        performSelector(onMainThread: #selector(fetchJson), with: nil, waitUntilDone: false)
    }
    
    @objc func fetchJson(){
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else if navigationController?.tabBarItem.tag == 1 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }else {
            urlString = "https://www.whitehouse.gov"
            let ac = UIAlertController(title: "Whitehouse", message: "Don't know URL", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title:"OK", style: .default))
            present(ac, animated: true)
        }
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    @objc func searchResults(){
        let ac = UIAlertController(title: "Search title", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] _ in
            guard let title = ac?.textFields?[0].text else { return }
            self?.submit(title)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ title: String){
        searchPetitions.removeAll(keepingCapacity: true)
        for item in petitions {
            if item.title.contains(title) || item.body.contains(title){
                searchPetitions.append(item)
            }
        }
        if searchPetitions.isEmpty {
            let ac = UIAlertController(title: "Well", message: "没有找到你要的结果", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title:"OK", style: .default))
            present(ac, animated: true)
        }
        tableView.reloadData()
    }
    
    @objc func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title:"OK", style: .default))
        present(ac, animated: true)
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
        }else{
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchPetitions.count > 0 ? searchPetitions.count : petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = searchPetitions.count > 0 ? searchPetitions[indexPath.row] : petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = DetailViewController()
        ac.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(ac, animated: true)
    }

}

