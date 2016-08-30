//
//  LateralTableViewCell.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 29/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class LateralTableViewCell: UITableViewCell , UITextFieldDelegate {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var edtValor: UITextField!
    
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
