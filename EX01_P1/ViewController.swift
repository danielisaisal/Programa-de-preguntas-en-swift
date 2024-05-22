//
//  ViewController.swift
//  EX01_P1
//
//  Created by DANIEL SALDANA on 18/03/23.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcNivelPreguntas" {
            let destinationVC = segue.destinationController as! nivelDePreguntadosVC
        }
        else if(segue.identifier == "dificultadMatematik"){
            let destinoVC = segue.destinationController as! vcNivelMatematik
        }
    }

    @IBAction func btnPreguntados(_ sender: NSButton) {
        performSegue(withIdentifier: "vcNivelPreguntas", sender: self)
    }
    
    @IBAction func btnMatematik(_ sender: NSButton) {
        performSegue(withIdentifier: "dificultadMatematik", sender: self)
    }
    
}

