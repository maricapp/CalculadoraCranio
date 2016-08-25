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
    var names = [String]()
    var lastSelectIndex = 0
    
    //FUNC - PREENCHE A LISTA
    func appendNames(){
        names.append("Angulo da Concavidade Frontal")
        names.append("Comprimento Máximo do Crânio")
        names.append("Largura Máxima do Crânio")
        names.append("Altura Basion-Bregma")
        names.append("Comprimento Basion-Nasion")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PREENCHER A LISTA
        appendNames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //QTD NA LISTAA
        return names.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //OBTEM CELULAR PELO IDENTIFIER
        let cell = tableView.dequeueReusableCellWithIdentifier("SuperiorTableViewCell", forIndexPath: indexPath) as! SuperiorTableViewCell
        //POPULAR TEXTO DO LABEL DA CELULA
        cell.cellLabel.text = names[indexPath.item]
        
        return cell
    }

    //evento para celulas retornadas => o que acontece quando eu toco na celula
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        lastSelectIndex = indexPath.item
        self.performSegueWithIdentifier("SuperiorDetalheSegue", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let otherView = segue.destinationViewController as! ViewController
        
        
        otherView.messageReceived = names[lastSelectIndex]
    }

}
