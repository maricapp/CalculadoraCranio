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
    
    //FUNC - PREENCHE A LISTA
    func adicionaMedicoes(){
        medicoes.append("Angulo da Concavidade Frontal")
        medicoes.append("Comprimento Máximo do Crânio")
        medicoes.append("Largura Máxima do Crânio")
        medicoes.append("Altura Basion-Bregma")
        medicoes.append("Comprimento Basion-Nasion")
    }
    
    func adicionaValoresIniciais(){
        valores.append(0)
        valores.append(0)
        valores.append(0)
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
        let cell = tableView.dequeueReusableCellWithIdentifier("SuperiorTableViewCell", forIndexPath: indexPath) as! SuperiorTableViewCell
        cell.cellLabel.text = medicoes[indexPath.item]
        cell.edtValor.tag = indexPath.row
        cell.edtValor.addTarget(self, action: "sentEventsEditingDidEnd:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        return cell
    }

    //evento para celulas retornadas => o que acontece quando eu toco na celula
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //lastSelectIndex = indexPath.item
        //self.performSegueWithIdentifier("SuperiorDetalheSegue", sender: self)
    }
 
    
    @IBAction func sentEventsEditingDidEnd(sender: UITextField) {
        
        let edtValorRow = sender.tag
        
        let texto:String? = sender.text
        
        if (texto != nil)
        {
            let floatValue : Float = NSString(string: texto!).floatValue
            valores[edtValorRow] = floatValue
        }
        
        print(valores)
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let otherView = segue.destinationViewController as! ViewController
        
        
        otherView.messageReceived = medicoes[lastSelectIndex]
    }*/

}
