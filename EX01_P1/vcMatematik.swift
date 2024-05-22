//
//  vcMatematik.swift
//  EX01_P1
//
//  Created by DANIEL SALDANA on 19/03/23.
//

import Cocoa

class vcMatematik: NSViewController {
    
    var nivel:String?
    var status:String?
    var numero1:Int = 0
    var numero2:Int = 0
    var resultado:Int = 0
    var respuesta:Int = 0
    var vidas:Int = 0
    var contadorCorrectas:Int = 0
    var contadorIntentos:Int = 1
    var ganadas:Int = 0
    var limite:Int = 0
    var rachaGeneral:Int = 0
    var rachaP:Int = 0
    var imgVidas: [String] = ["corazones4", "corazones3","corazones2","corazones1"]
    let operadores:[String] = ["+", "-", "*"]
    var operador:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNumero1.isHidden = true
        lblNumero2.isHidden = true
        lblRacha.isHidden = true
        lblAciertos.isHidden = true
        lblSigno.isHidden = true
        btnValidar.isHidden = true
        txtRespuesta.isHidden = true
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcGanar" {
            let destinationVC = segue.destinationController as! vcGanar
            destinationVC.status = status
        }
    }
    
    @IBAction func inicio(_ sender: NSButton){
        lblNumero1.isHidden = false
        lblNumero2.isHidden = false
        lblRacha.isHidden = false
        lblAciertos.isHidden = false
        lblSigno.isHidden = false
        btnValidar.isHidden = false
        btnInicio.isHidden = true
        txtRespuesta.isHidden = false
        if(nivel == "Principiante"){
            vidas = 3
            contadorCorrectas = 0
            ganadas = 5
            imgCorazones.image = NSImage(named: imgVidas[vidas])
            numero1 = Int.random(in: 1...100)
            numero2 = Int.random(in: 1...100)
            operador = operadores.randomElement()!
            lblNumero1.stringValue = "\(numero1)"
            lblNumero2.stringValue = "\(numero2)"
            lblSigno.stringValue = "\(operador)"
        }
        else if(nivel == "Intermedio"){
            vidas = 2
            contadorCorrectas = 0
            ganadas = 7
            imgCorazones.image = NSImage(named: imgVidas[vidas])
            numero1 = Int.random(in: 1...100)
            numero2 = Int.random(in: 1...100)
            operador = operadores.randomElement()!
            lblNumero1.stringValue = "\(numero1)"
            lblNumero2.stringValue = "\(numero2)"
            lblSigno.stringValue = "\(operador)"
        }
        else if(nivel == "Avanzado"){
            vidas = 1
            contadorCorrectas = 0
            ganadas = 10
            imgCorazones.image = NSImage(named: imgVidas[vidas])
            numero1 = Int.random(in: 1...100)
            numero2 = Int.random(in: 1...100)
            operador = operadores.randomElement()!
            lblNumero1.stringValue = "\(numero1)"
            lblNumero2.stringValue = "\(numero2)"
            lblSigno.stringValue = "\(operador)"
        }
    }
    
    @IBAction func respuestas(_ sender: NSButton){
        if(txtRespuesta.stringValue != ""){
                if(contadorCorrectas == ganadas){
                    status = "Ganaste \n Racha: \(rachaP) \n Jugadas: \(contadorIntentos) \n Score: \(contadorCorrectas)"
                    performSegue(withIdentifier: "vcGanar", sender: self)
                    self.view.window?.windowController?.close()
                }
                else{
                    switch(operador){
                        case "+":
                            resultado = numero1 + numero2
                        case "-":
                            resultado = numero1 - numero2
                        case "*":
                            resultado = numero1 * numero2
                        default:
                            txtRespuesta.stringValue = "sucedio algo"
                    }
                    respuesta = Int(txtRespuesta.stringValue)!
                    if(respuesta == resultado){
                        contadorCorrectas += 1
                        rachaGeneral += 1
                        lblAciertos.stringValue = "\(contadorCorrectas)"
                        numero1 = Int.random(in: 1...100)
                        numero2 = Int.random(in: 1...100)
                        operador = operadores.randomElement()!
                        lblNumero1.stringValue = "\(numero1)"
                        lblNumero2.stringValue = "\(numero2)"
                        lblSigno.stringValue = "\(operador)"
                        if(rachaP < rachaGeneral){
                            rachaP = rachaGeneral
                        }
                        contadorIntentos += 1
                    }
                    else{
                        vidas -= 1
                        imgCorazones.image = NSImage(named: imgVidas[vidas])
                        numero1 = Int.random(in: 1...100)
                        numero2 = Int.random(in: 1...100)
                        operador = operadores.randomElement()!
                        lblNumero1.stringValue = "\(numero1)"
                        lblNumero2.stringValue = "\(numero2)"
                        lblSigno.stringValue = "\(operador)"
                        contadorIntentos += 1
                        if(vidas == 0){
                            status = "Perdiste \n Mejor racha: \(rachaP) \n Jugadas: \(contadorIntentos) \n Score: \(contadorCorrectas)"
                            performSegue(withIdentifier: "vcGanar", sender: self)
                            self.view.window?.windowController?.close()
                        }
                        
                    }
                }
                
            
        }
    }
    
    @IBOutlet weak var btnValidar: NSButton!
    @IBOutlet weak var btnInicio: NSButton!
    @IBOutlet weak var lblNumero1: NSTextField!
    @IBOutlet weak var lblNumero2: NSTextField!
    @IBOutlet weak var lblAciertos: NSTextField!
    @IBOutlet weak var lblSigno: NSTextField!
    @IBOutlet weak var imgCorazones: NSImageCell!
    @IBOutlet weak var lblRacha: NSTextField!
    @IBOutlet weak var txtRespuesta: NSTextField!
    @IBOutlet weak var lblDescripcion: NSTextField!
    
}
