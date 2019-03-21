//
//  ServicesTableViewController.swift
//  Business App
//
//  Created by Pramodya Abeysinghe on 21/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit

class ServicesTableViewController: UITableViewController {

    var items = [[String: String]]()
    
    func loadPList() -> [[String: String]] {
        let path = Bundle.main.path(forResource: "ServiceList", ofType: "plist")
        
        return NSArray(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String : String]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.items = loadPList()
        
        tableView.backgroundView = UIImageView.init(image: UIImage(named: "Background"))
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ServicesTableViewCell
        let item = self.items[indexPath.row]
        
        cell.cellLabel.text = item["Title"]
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let dvc = segue.destination as! ServicesViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let item = self.items[indexPath.row]
                
                dvc.sentData1 = item["Title"]
                dvc.sentData2 = item["Description"]
                dvc.sentData3 = item["Image"]
            }
        }
    }
    
}
