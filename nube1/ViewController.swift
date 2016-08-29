//
//  ViewController.swift
//  nube1
//
//  Created by Oscar Zarco on 26/08/16.
//  Copyright © 2016 oscarzarco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet var buscarText: UITextField!
    @IBOutlet var resultadoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buscarText.delegate = self
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func textFieldShouldReturn(textField: UITextField) -> Bool {
        buscar()
        return true
    }
    
    
    func buscar(){
        print("Inicio busqueda")
        
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + buscarText.text! //978-84-376-0494-7"
        let url = NSURL(string: urls)
        
        var datos : NSData? = nil
        
        do {
            datos = try NSData(contentsOfURL: url!,options: [])
            let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            print(texto)
            let te : String = String(texto)
            self.resultadoTextView.text = te
        } catch {
             print("Error")
            let mensaje = UIAlertController.init(title:"Error", message: "Hay un error de conexion", preferredStyle: UIAlertControllerStyle.Alert )
            let accionOK = UIAlertAction(title: "OK",style: .Default){ accion in
                print("OK")
            }
            
            mensaje.addAction(accionOK)
            self.presentViewController(mensaje, animated: true, completion: nil)
            }
    }
       
}