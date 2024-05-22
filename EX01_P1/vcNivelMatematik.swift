//
//  vcNivelMatematik.swift
//  EX01_P1
//
//  Created by DANIEL SALDANA on 19/03/23.
//

import Cocoa

class vcNivelMatematik: NSViewController {

    var titulo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcMatematik" {
            let destinationVC = segue.destinationController as! vcMatematik
            destinationVC.nivel = titulo
        }
    }
    
    @IBAction func btnPrincipiante(_ sender: NSButton) {
        titulo = "Principiante"
        performSegue(withIdentifier: "vcMatematik", sender: self)
    }
    
    @IBAction func btnIntermedio(_ sender: NSButton) {
        titulo = "Intermedio"
        performSegue(withIdentifier: "vcMatematik", sender: self)
    }
    
    @IBAction func btnAvanzado(_ sender: NSButton) {
        titulo = "Avanzado"
        performSegue(withIdentifier: "vcMatematik", sender: self)
    }
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
}
