//
//  LateralTableViewCell.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 29/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class LateralTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var edtValor: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
