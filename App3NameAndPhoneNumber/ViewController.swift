//
//  ViewController.swift
//  App3NameAndPhoneNumber
//
//  Created by rongbaobao888 on 12/9/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var names: [String] = [String]()
    
    var phoneNumbers: [String] = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddNameAndPhoneNumber(_ sender: UIBarButtonItem) {
        var nameField = UITextField()
        var phoneNumberField = UITextField()
        
        let alert = UIAlertController(title: "Add Name And Phone Number", message: "", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { addAction in
            guard let name = nameField.text else { return }
            guard let phoneNumber = phoneNumberField.text else { return }
            self.names.append(name)
            self.phoneNumbers.append(phoneNumber)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { cancelAction in
            print("Do not add any personal information.")
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter Your Name:"
            nameField = alertTextField
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter Your Phone Number:"
            phoneNumberField = alertTextField
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameAndPhoneNumberCell", for: indexPath)
        cell.textLabel?.text = "Name: \(names[indexPath.row])      Phone Number: \(phoneNumbers[indexPath.row])"
        return cell
    }
    

}

