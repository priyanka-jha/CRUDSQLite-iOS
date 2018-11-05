//
//  EditViewController.swift
//  ListViewDemo
//
//  Created by Megavision Technologies on 02/08/18.
//  Copyright © 2018 Megavision Technologies. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var getId:Int = Int()
    var getName = ""
    var getMobile = ""
    var getEmail = ""

   
    @IBOutlet weak var textName: UITextField!
   
    @IBOutlet weak var textMobile: UITextField!
    
    @IBOutlet weak var textEmail: UITextField!
    
    @IBAction func updateButton(_ sender: Any) {
    _ = DBModel.getInstance().updateData(RecordId: getId, Name: textName.text!, Mobile: textMobile.text!, Email: textEmail.text!)
        
        print("DATA UPDATED SUCCESSFULLY")
      //  ToastView.shared.long(self.view, txt_msg: "Data updated successfully!!")
        
       let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       let DV = MainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
       self.navigationController?.pushViewController(DV, animated: true)
       
   
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        textName.text! = getName
        textMobile.text! = getMobile
        textEmail.text = getEmail
        
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
