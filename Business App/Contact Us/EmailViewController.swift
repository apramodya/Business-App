//
//  EmailViewController.swift
//  Business App
//
//  Created by Pramodya Abeysinghe on 22/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button1.layer.cornerRadius = 5
        message.layer.cornerRadius = 5
        
        self.navigationItem.title = "Email Us"
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dismissKeyboard(_ sender: Any) {
        self.resignFirstResponder()
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    @IBAction func send(_ sender: Any) {
        let mcvc: MFMailComposeViewController = MFMailComposeViewController()
        mcvc.mailComposeDelegate = self
        
        let recipient = ["abc@gmail.com"]
        mcvc.setToRecipients(recipient)
        mcvc.setSubject(name.text!)
        mcvc.setMessageBody("""
            Name: \(name.text!)
            Email: \(email.text!)
            Message: \(message.text!)
            """, isHTML: false)
        
        self.present(mcvc, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
