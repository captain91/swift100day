//
//  DetailViewController.swift
//  Project-day50
//
//  Created by Shibo Sun on 2021/4/2.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageVIew: UIImageView!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = person.name
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        imageVIew.image = UIImage(contentsOfFile: path.path)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

}
