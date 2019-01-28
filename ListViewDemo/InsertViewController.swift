//
//  InsertViewController.swift
//  ListViewDemo
//
//  Created by Priyanka on 28/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    

    @IBOutlet weak var mobileText: UITextField!
    
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBAction func submitButton(_ sender: Any) {
        
        var TableInfo:Table_Info = Table_Info()
        TableInfo.Name = nameText.text!
        TableInfo.MobileNo = mobileText.text!
        TableInfo.Email = emailText.text!
        
        let isInserted=DBModel.getInstance().InsertData(TableInfo)
        if isInserted{
             print("DATA INSERTED")
                    
            let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let DV = MainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(DV, animated: true)
            
            
        }
        else{
             print("DATA not INSERTED")
            
        }
        
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
