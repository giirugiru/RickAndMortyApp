//
//  Extensions.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 20/04/23.
//

import Foundation
import Toast_Swift


extension UIViewController {
    func makeToast(error: Error? = nil) {
        
        #if RELEASE
        self.view.makeToast("Something went wrong, please try again later.")
        return
        #endif
        
        #if DEBUG
        self.view.makeToast(error?.localizedDescription)
        #endif
    }
}
