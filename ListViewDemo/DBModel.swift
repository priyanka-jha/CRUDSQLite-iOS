//
//  DBModel.swift
//  ListViewDemo
//
//  Created by Priyanka on 28/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import Foundation
import UIKit


let sharedInstance = DBModel()

class DBModel: NSObject {
    
    var database:FMDatabase? = nil
    
    class func getInstance() -> DBModel
    {
        if (sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Util.getPath(fileName: "listviewdemo.sqlite"))
            
        }
        return sharedInstance
    }

    
   //Insert Data
    
    func  InsertData(_ Table_Info:Table_Info) -> Bool {
        sharedInstance.database!.open()
       
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO LIST_TABLE(NAME,MOBILE,EMAIL) VALUES(?,?,?)",withArgumentsIn: [Table_Info.Name,Table_Info.MobileNo,Table_Info.Email])
        
        
        sharedInstance.database!.close()
        return (isInserted != nil)
    }
    
    
    //Fetch Data
    
    func GetAllData() -> NSMutableArray {
        sharedInstance.database!.open()
        
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM LIST_TABLE", withArgumentsIn: [0])
        
        let itetmInfo:NSMutableArray = NSMutableArray()
        if(resultSet != nil)
        {
            
            while resultSet.next() {
                
                let item:Table_Info = Table_Info()
                item.Id = Int(resultSet.int(forColumn: "ID"))
                item.Name = String(resultSet.string(forColumn: "NAME")!)
                item.MobileNo = String(resultSet.string(forColumn: "MOBILE")!)
                item.Email = String(resultSet.string(forColumn: "EMAIL")!)
                
                itetmInfo.add(item)
                
                
               }
            
            
        }
        
        sharedInstance.database!.close()
        return itetmInfo
        
        
    }
    
    //Update Data
    func updateData(RecordId:Int,Name:String,Mobile:String,Email:String) -> NSMutableArray {
        sharedInstance.database!.open()
        
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("UPDATE LIST_TABLE SET NAME = ?,MOBILE = ?,EMAIL = ? WHERE ID = ?", withArgumentsIn: [Name,Mobile,Email,RecordId])
        
        let itetmInfo:NSMutableArray = NSMutableArray()
        if(resultSet != nil)
        {
            
            while resultSet.next() {
                
                let item:Table_Info = Table_Info()
                item.Id = Int(resultSet.int(forColumn: "ID"))
                item.Name = String(resultSet.string(forColumn: "NAME")!)
                item.MobileNo = String(resultSet.string(forColumn: "MOBILE")!)
                item.Email = String(resultSet.string(forColumn: "EMAIL")!)
                
                itetmInfo.add(item)
                
                
            }
            
            
        }
        
        sharedInstance.database!.close()
        return itetmInfo
        
   
    
    }
    
    //Delete Data
    func deleteData(RecordId:Int) -> NSMutableArray {
        sharedInstance.database!.open()
        
        let resultSet:FMResultSet! = sharedInstance.database!.executeQuery("DELETE FROM LIST_TABLE WHERE ID = ?", withArgumentsIn: [RecordId])
        
        let itetmInfo:NSMutableArray = NSMutableArray()
        if(resultSet != nil)
        {
            
            while resultSet.next() {
                
                let item:Table_Info = Table_Info()
                item.Id = Int(resultSet.int(forColumn: "ID"))
                item.Name = String(resultSet.string(forColumn: "NAME")!)
                item.MobileNo = String(resultSet.string(forColumn: "MOBILE")!)
                item.Email = String(resultSet.string(forColumn: "EMAIL")!)
                
                itetmInfo.add(item)
                
                
            }
            
            
        }
        
        sharedInstance.database!.close()
        return itetmInfo
        
        
        
    }
    
    
    
    
    
    
}
