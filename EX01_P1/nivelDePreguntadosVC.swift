//
//  nivelDePreguntadosVC.swift
//  EX01_P1
//
//  Created by DANIEL SALDANA on 18/03/23.
//

import Cocoa

class nivelDePreguntadosVC: NSViewController {

    var titulo:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcPreguntas" {
            let destinationVC = segue.destinationController as! vcPreguntas
            destinationVC.nivel = titulo
        }
    }
    
    @IBAction func btnPrincipiante(_ sender: NSButton) {
        titulo = "Principiante"
        performSegue(withIdentifier: "vcPreguntas", sender: self)
    }
    
    @IBAction func btnIntermedio(_ sender: NSButton) {
        titulo = "Intermedio"
        performSegue(withIdentifier: "vcPreguntas", sender: self)
    }
    
    @IBAction func btnAvanzado(_ sender: NSButton) {
        titulo = "Avanzado"
        performSegue(withIdentifier: "vcPreguntas", sender: self)
    }
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
}
