//
//  ViewController.swift
//  Project-day50
//
//  Created by Shibo Sun on 2021/4/2.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var people = [Person]()
    
    var editButton: UIButton!
    var editingMode = false {
        didSet {
            if editingMode {
                editButton.setTitle("Done", for: .normal)
                editButton.sizeToFit()
            }else {
                editButton.setTitle("Edit", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Person Storm"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPerson))
        editButton = UIButton()
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.systemBlue, for: .normal)
        editButton.addTarget(self, action: #selector(changeEditingMode), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: editButton)
        
        let defaults = UserDefaults.standard
        if let savedPeople = defaults.object(forKey: "people") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                people = try jsonDecoder.decode([Person].self, from: savedPeople)
            }catch{
                print("Fail to laod people.")
            }
        }
        
    }
    @objc func changeEditingMode(){
        editingMode.toggle()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "people", for: indexPath) as? PersonCell else {
            fatalError("Unable to dequeue PersonCell")
        }
        let person = people[indexPath.row]
        cell.name.text = person.name
        
        let path = getDocumentsDirectory().appendingPathComponent(person.image)
        cell.imageV.image = UIImage(contentsOfFile: path.path)
        
        cell.imageV.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageV.layer.borderWidth = 2
        cell.imageV.layer.cornerRadius = 5
        return cell
    }
    
    @objc func addNewPerson(){
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
//        picker.sourceType = .camera
        present(picker,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let person = Person(name: "Unknown", image: imageName)
        people.append(person)
        save()
        tableView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]
        
        if editingMode {
            print("rename")
            let ac = UIAlertController(title: "Rename Person", message: nil, preferredStyle: .alert)
            ac.addTextField(configurationHandler: nil)
            ac.addAction(UIAlertAction(title: "Rename", style: .default, handler: { [weak self, weak ac] _ in
                guard let newName = ac?.textFields?[0].text else {return}
                person.name = newName
                self?.save()
                self?.tableView.reloadData()
            }))
            ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(ac, animated: true, completion: nil)
        }else{
            print("detail")
            if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
                vc.person = person
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func save(){
        let jsonEncoder = JSONEncoder()
        
        if let savedData = try? jsonEncoder.encode(people){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "people")
        }else{
            print("Failed to save people.")
        }
    }


}

