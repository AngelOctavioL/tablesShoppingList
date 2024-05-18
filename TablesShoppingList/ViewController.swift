//
//  ViewController.swift
//  TablesShoppingList
//
//  Created by Diplomado on 18/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    var arrayShoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func addButton(_ sender: Any) {
        print("Hola desde el boton")
        arrayShoppingList.append(textField.text ?? "")
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberRows = 0
        if section == 0 {
            numberRows = arrayShoppingList.count
        }
        return numberRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = arrayShoppingList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "My Shopping List"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                    // Show confirmation alert
                    let alert = UIAlertController(title: "Delete", message: "Are you sure you want to delete this item?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
                        // Update the data source
                        self.arrayShoppingList.remove(at: indexPath.row)
                        
                        // Update the table view
                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
        }
}

