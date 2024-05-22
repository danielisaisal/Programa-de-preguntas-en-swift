//
//  vcGanar.swift
//  EX01_P1
//
//  Created by DANIEL SALDANA on 20/03/23.
//

import Cocoa

class vcGanar: NSViewController {

    var status:String?
    var racha:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        lblStatus.stringValue = status!
        
    }
    
    
    @IBAction func btnSalir(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
    
    @IBOutlet weak var lblStatus: NSTextField!
}
