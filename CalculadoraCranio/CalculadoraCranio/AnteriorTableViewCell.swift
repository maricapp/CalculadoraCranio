//
//  AnteriorTableViewCell.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 26/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class AnteriorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var edtValor: UITextField!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        edtValor.resignFirstResponder()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }    
}
