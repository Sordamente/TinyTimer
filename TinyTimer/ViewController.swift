//
//  ViewController.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/14/21.
//

import SwiftUI

class ContentViewController: NSHostingController<ContentView> {
    @objc required dynamic init?(coder: NSCoder) {
        super.init(coder: coder, rootView: ContentView())
    }
    
    required dynamic override init(rootView: ContentView) {
        super.init(rootView: rootView)
    }
    
    override func keyDown(with event: NSEvent) {
        if (event.keyCode == 51) {
            _ = rootView.timertext.val.popLast()
            
            return
        }
        
        if (validInputs.contains(event.characters!)) {
            rootView.timertext.val += String(event.characters!)
            
            return
        }
        
        if (event.keyCode == 36) {
            // Create a new timer view
            
            if (event.modifierFlags.rawValue == 256) {
                // Start the timer
            }
            
            return
        }
    }
}

class TimerText: ObservableObject {
    @Published var val = ""
    
    func parse() {
        
    }
}
