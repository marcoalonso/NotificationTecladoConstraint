//
//  ViewController.swift
//  AlturaTecladoConstraint
//
//  Created by Marco Alonso Rodriguez on 09/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keyboardButtonConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObservations()
    }
    
    func addObservations() {
        // Abre el teclado
        NotificationCenter.default.addObserver(self, selector: #selector(mostrarTeclado(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // Oculta teclado
        NotificationCenter.default.addObserver(self, selector: #selector(ocultarTeclado(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func mostrarTeclado(_ notification: Notification) {
        // Obtener el tamaño
        if let userInfo = notification.userInfo,
           let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            // Ajustar el constraint del boton
            let distanciaTeclado = keyboardSize.height
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn) {
                self.keyboardButtonConstraint.constant = distanciaTeclado - 30
            }
        }
    }
    
    @objc func ocultarTeclado(_ notification: Notification) {
        //Animacion
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.keyboardButtonConstraint.constant = 0
        }, completion: nil)
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

