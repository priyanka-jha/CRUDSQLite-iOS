//
//  DetailsViewController.swift
//  ListViewDemo
//
//  Created by Megavision Technologies on 02/08/18.
//  Copyright © 2018 Megavision Technologies. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var textName: UITextField!
   
    @IBOutlet weak var textMobile: UITextField!
    
    @IBOutlet weak var textEmail: UITextField!
    
    @IBAction func submitButton(_ sender: Any) {
   
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
