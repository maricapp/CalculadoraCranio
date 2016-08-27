//
//  SuperiorTableViewController.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 24/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class SuperiorTableViewController: UITableViewController {
    
    //INSTANCIA A LISTA
    var medicoes = [String]()
    var valores = [Float]()
    var lastSelectIndex = 0
    
    var calcObj = Calculadora()
    
    //FUNC - PREENCHE A LISTA
    func adicionaMedicoes(){
        medicoes.append("Angulo da Concavidade Frontal")
        medicoes.append("Comprimento Máximo do Crânio")
        medicoes.append("Largura Máxima do Crânio")
        medicoes.append("Altura Basion-Bregma")
        medicoes.append("Comprimento Basion-Nasion")
    }
    
    @IBOutlet weak var lblResultado: UIBarButtonItem!
    
    func adicionaValoresIniciais(){
        valores.append(0)
        valores.append(0)
        valores.append(0)
        valores.append(0)
        valores.append(0)
    }
    
    
    let resultadoTopo: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResultado.title = ""
        
        //PREENCHE LISTAS
        adicionaMedicoes()
        adicionaValoresIniciais()
        
        resultadoTopo.setImage(UIImage(named: "nd32.png"), forState: UIControlState.Normal)
        resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
        let barButton = UIBarButtonItem(customView: resultadoTopo)
        self.navigationItem.rightBarButtonItem = barButton
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
        let cell = tableView.dequeueReusableCellWithIdentifier("SuperiorTableViewCell", forIndexPath: indexPath) as! SuperiorTableViewCell
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
        
        calcObj.attribuirMedidasSuperior(valores)
        //var genero:String = calcObj.obterGenero()
        print("SUPERIOR:")
        print(valores)
        print(calcObj.obterGenero())
        print("")
        
        /*if let font = UIFont(name: "AvenirNext", size: 11) {
            lblResultado.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }*/
        
        if calcObj.obterGenero() == "F" {
            resultadoTopo.setImage(UIImage(named: "female32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        } else if calcObj.obterGenero() == "M" {
            resultadoTopo.setImage(UIImage(named: "male32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        } else if calcObj.obterGenero() == "-1" {
            resultadoTopo.setImage(UIImage(named: "nd32.png"), forState: UIControlState.Normal)
            resultadoTopo.frame = CGRectMake(0, 0, 32, 32)
            let barButton = UIBarButtonItem(customView: resultadoTopo)
            self.navigationItem.rightBarButtonItem = barButton
        }
        
    }
}

