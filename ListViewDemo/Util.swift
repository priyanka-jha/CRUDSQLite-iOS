//
//  Util.swift
//  ListViewDemo
//
//  Created by Megavision Technologies on 02/08/18.
//  Copyright © 2018 Megavision Technologies. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    class func getPath(fileName: String) -> String {
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        print(fileURL)
        return fileURL.path
}
}
