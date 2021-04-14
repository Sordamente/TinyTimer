//
//  ContentView.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/9/21.
//

import SwiftUI

let validInputs = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM. "

struct ContentView: View {
    @ObservedObject var timertext = TimerText()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(timertext.val)
            
            Spacer()
            
            HStack {
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Image(systemName: "power")
                }
                
                Spacer()
                
                Button(action: {
                    print("Clear")
                }) {
                    Image(systemName: "trash")
                }
                
                Button(action: {
                    print("Settings")
                }) {
                    Image(systemName: "gearshape")
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

class TimerText: ObservableObject {
    @Published var val = "type something"
    
    func parse() {
        
    }
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
