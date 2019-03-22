//
//  SocialTableViewController.swift
//  Business App
//
//  Created by Pramodya Abeysinghe on 22/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit

class SocialTableViewController: UITableViewController {

    var items = [[String: String]]()
    
    func loadPList() -> [[String: String]] {
        let path = Bundle.main.path(forResource: "SocialList", ofType: "plist")
        
        return NSArray(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String : String]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.items = loadPList()
        self.tableView.rowHeight = 80
        tableView.backgroundView = UIImageView(image: UIImage(named: "Background"))
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.title = "Social Links"
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SocialTableViewCell

        // Configure the cell...
        let item = items[indexPath.row]
        cell.cellImage.image = UIImage(named: item["Image"]!)
        cell.label.text = item["Title"]
        cell.cellImage.layer.cornerRadius = 5

        return cell
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            let svc = segue.destination as! SocialViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let item = items[indexPath.row]
                
                svc.sentData1 = item["Title"]
                svc.sentData2 = item["Link"]
            }
        }
        
    }

}
