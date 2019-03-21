//
//  ServicesViewController.swift
//  Business App
//
//  Created by Pramodya Abeysinghe on 21/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {

    @IBOutlet weak var detailLable: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    var sentData1: String!
    var sentData2: String!
    var sentData3: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = sentData1
        
        detailLable.text = sentData1
        detailTextView.text = sentData2
        detailImageView.image = UIImage(named: sentData3)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
