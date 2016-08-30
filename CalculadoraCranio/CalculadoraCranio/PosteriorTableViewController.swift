//
//  PosteriorTableViewController.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 29/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class PosteriorTableViewController: UITableViewController {
    
    //INSTANCIA A LISTA
    var medicoes = [String]()
    var valores = [Float]()
    var lastSelectIndex = 0
    let resultadoTopo: UIButton = UIButton()
    
    //FUNC - PREENCHE A LISTA
    func adicionaMedicoes(){
        medicoes.append("xxxxx")
    }
    
    @IBOutlet weak var lblResultado: UIBarButtonItem!
    
    func adicionaValoresIniciais(){
        valores.append(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lblResultado.title = ""
        
        //PREENCHE LISTAS
        adicionaMedicoes()
        adicionaValoresIniciais()
        
        resultadoTopo.setImage(UIImage(named: "nd32.png"), forState: UIControlState.Normal)
        resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
        let barButton = UIBarButtonItem(customView: resultadoTopo)
        self.navigationItem.rightBarButtonItem = barButton
        
        
        
        let genero = CalcSingleton.obterGenero()
        atualizaIcone(genero)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let genero = CalcSingleton.obterGenero()
        atualizaIcone(genero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicoes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PosteriorTableViewCell", forIndexPath: indexPath) as! PosteriorTableViewCell
        cell.cellLabel.text = medicoes[indexPath.item]
        cell.edtValor.tag = indexPath.row
        cell.edtValor.addTarget(self, action: "sentEventsEditingDidEnd:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
    }
    
    @IBAction func sentEventsEditingDidEnd(sender: UITextField) {
        
        let posicao = sender.tag
        let valorDigitado:String? = sender.text
        
        if (valorDigitado != nil)
        {
            let valor : Float = NSString(string: valorDigitado!).floatValue
            valores[posicao] = valor
        }
        
        /*CalcSingleton.attribuirMedidasSuperior{ (varFromFunction:[Float]) in
         print("varFromFunction")
         print(varFromFunction)
         return self.valores
         }*/
        
        CalcSingleton.attribuirMedidasSuperior(self.valores)
        let genero = CalcSingleton.obterGenero()
        
        atualizaIcone(genero)
        
    }
    
    func atualizaIcone(genero:String){
        if genero == "F" {
            resultadoTopo.setImage(UIImage(named: "female32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        } else if genero == "M" {
            resultadoTopo.setImage(UIImage(named: "male32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        } else if genero == "-1" {
            resultadoTopo.setImage(UIImage(named: "nd32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        }
        
    }


}
