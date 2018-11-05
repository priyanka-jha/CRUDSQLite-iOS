//
//  InfoTableViewCell.swift
//  ListViewDemo
//
//  Created by Megavision Technologies on 02/08/18.
//  Copyright © 2018 Megavision Technologies. All rights reserved.
//

import UIKit

protocol buttonDelegate {
    func EditButton(sender:InfoTableViewCell)
    func DeleteButton(sender:InfoTableViewCell)
}





class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
 
    @IBOutlet weak var labelMobile: UILabel!
    
    @IBOutlet weak var labelEmail: UILabel!
    
    var editData:buttonDelegate?
    
    @IBAction func editButton(_ sender: Any) {
   
    self.editData?.EditButton(sender: self)
    
    
    }
    
  
    
    @IBAction func deleteButton(_ sender: Any) {
        self.editData?.DeleteButton(sender: self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
