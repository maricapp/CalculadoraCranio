//
//  AnteriorTableViewController.swift
//  CalculadoraCranio
//
//  Created by Usuário Convidado on 26/08/16.
//  Copyright © 2016 LLMM. All rights reserved.
//

import UIKit

class AnteriorTableViewController: UITableViewController {
    
    //INSTANCIA A LISTA
    var medicoes = [String]()
    var valores = [Float]()
    var lastSelectIndex = 0
    
    //FUNC - PREENCHE A LISTA
    func adicionaMedicoes(){
        medicoes.append("Largura Facial Superior")
        medicoes.append("Altura Facial Superior")
    }
    
    func adicionaValoresIniciais(){
        valores.append(0)
        valores.append(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PREENCHE LISTAS
        adicionaMedicoes()
        adicionaValoresIniciais()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("AnteriorTableViewCell", forIndexPath: indexPath) as! AnteriorTableViewCell
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
        
        let calc = Calculadora()
        calc.attribuirMedidasAnterior(valores)
        
        print("ANTERIOR:")
        print(valores)
        print(calc.obterGenero())
        print("")
    }
}







