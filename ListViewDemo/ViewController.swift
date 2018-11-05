//
//  ViewController.swift
//  ListViewDemo
//
//  Created by Megavision Technologies on 02/08/18.
//  Copyright © 2018 Megavision Technologies. All rights reserved.

                //***** Showing data in Listview from Database,Toast,Alert Dialog *****//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,buttonDelegate {
   
    func EditButton(sender: InfoTableViewCell) {
        let cell = sender.tag
        var l = Table_Info()
        l = GetAllDataInfo.object(at: sender.tag) as! Table_Info
        
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DV = MainStoryboard.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        
        DV.getId = l.Id
        DV.getName = l.Name
        DV.getMobile =  l.MobileNo
        DV.getEmail = l.Email
        
        
        self.navigationController?.pushViewController(DV, animated: true)
        
    }
    
    func DeleteButton(sender: InfoTableViewCell) {
        print("Delete Clicked")
        
        // create the alert
        let alert = UIAlertController(title: "UIAlertController", message: "Are you sure You want to delete the data?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
            
            let cell = sender.tag
            var l = Table_Info()
            l = self.GetAllDataInfo.object(at: sender.tag) as! Table_Info
            
            _ = DBModel.getInstance().deleteData(RecordId: l.Id)
            
            
            self.GetAllDataInfo = DBModel.getInstance().GetAllData()
            self.tblTableView.reloadData()
        
        
        }
        ))
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
//        let cell = sender.tag
//        var l = Table_Info()
//        l = GetAllDataInfo.object(at: sender.tag) as! Table_Info
//
//        _ = DBModel.getInstance().deleteData(RecordId: l.Id)
//
//        ToastView.shared.long(self.view, txt_msg: "Data deleted successfully!!")
//
//        GetAllDataInfo = DBModel.getInstance().GetAllData()
//        tblTableView.reloadData()
        
        
        
        
    }
    
    var databasePath = String()
    var GetAllDataInfo = NSMutableArray()
   
    
    @IBOutlet weak var tblTableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        GetAllDataInfo = DBModel.getInstance().GetAllData()
        tblTableView.reloadData()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GetAllDataInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as! InfoTableViewCell
        cell.editData = self
        cell.tag = indexPath.row
        
        var l = Table_Info()
        l = GetAllDataInfo.object(at: indexPath.row) as! Table_Info
        cell.labelName.text! = l.Name
        cell.labelMobile.text! = l.MobileNo
        cell.labelEmail.text! = l.Email
        
        return cell
        
        
        
        
        
    }
    

   
    @IBAction func insertButton(_ sender: Any) {
    
        let MainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let DV = MainStoryboard.instantiateViewController(withIdentifier: "InsertViewController") as! InsertViewController
        self.navigationController?.pushViewController(DV, animated: true)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let filemgr = FileManager.default
        let dirPaths = filemgr.urls(for: .documentDirectory,
                                    in: .userDomainMask)
        
        databasePath = dirPaths[0].appendingPathComponent("listviewdemo.sqlite").path
        
        
        if !filemgr.fileExists(atPath: databasePath as String) {
            
            let contactDB = FMDatabase(path: databasePath as String)
            
            if contactDB == nil {
                print("Error: \(contactDB.lastErrorMessage())")
            }
            
            if (contactDB.open()) {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS LIST_TABLE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME VARCHAR, MOBILE VARCHAR, EMAIL VARCHAR)"
                
                print("database created")
                
                if !(contactDB.executeStatements(sql_stmt)) {
                    print("Error: \(contactDB.lastErrorMessage())")
                }
                contactDB.close()
            } else {
                print("Error: \(contactDB.lastErrorMessage())")
            }
            
            
        
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

