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
    var url:String = ""
    @IBOutlet weak var wiki: UIWebView!
    
    
    func loadPage(url: String){
        let url = NSURL(string: url)
        
        let request = NSURLRequest(URL: url!)
        
        wiki.loadRequest(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblDetalhe.text = mensagem
        
        loadPage(url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
