//
//  DetalhesViewController.swift
//  CalculadoraCranio
//
//  Created by Mariana Capp on 30/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    @IBOutlet weak var lblDetalhe: UILabel!
    var mensagem:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblDetalhe.text = mensagem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
