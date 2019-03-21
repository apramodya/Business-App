//
//  ContactUsViewController.swift
//  Business App
//
//  Created by Pramodya Abeysinghe on 22/3/19.
//  Copyright © 2019 Pramodya. All rights reserved.
//

import UIKit
import MapKit

class ContactUsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    var lon = 103.9417184
    var lat = 1.3242268
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        button1.layer.cornerRadius = 5
        button2.layer.cornerRadius = 5
        button3.layer.cornerRadius = 5
        button4.layer.cornerRadius = 5
        
        let span = MKCoordinateSpan.init(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pinLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lon)
        let pinAnnotation = MKPointAnnotation()
        pinAnnotation.coordinate = pinLocation
        pinAnnotation.title = "My company"
        pinAnnotation.subtitle = "55, New Upp Changi Rd"
        
        mapView.addAnnotation(pinAnnotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func directions(_ sender: Any) {
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(lat),\(lon)")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func callUs(_ sender: Any) {
        UIApplication.shared.open(URL(string: "6581349110")!, options: [:], completionHandler: nil)
    }
}
