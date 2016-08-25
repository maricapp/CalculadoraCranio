//
//  SuperiorTableViewCell.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 24/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class SuperiorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var edtValor: UITextField!
    @IBOutlet weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization codeeee
    }

  
    @IBAction func foo(sender: AnyObject) {
        print("aaaaaa")
    }
    @IBAction func asdasd(sender: AnyObject) {
        print("bbbb")
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
