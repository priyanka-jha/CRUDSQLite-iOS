//
//  Util.swift
//  ListViewDemo
//
//  Created by Priyanka on 28/01/19.
//  Copyright © 2019 Priyanka. All rights reserved.
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
