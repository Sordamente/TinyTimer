//
//  ContentView.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/9/21.
//

import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
