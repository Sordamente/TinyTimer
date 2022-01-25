//
//  ContentView.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var timertext = TimerText()
    @State var paused = false
    
    var body: some View {
        VStack {
            TimerBlock(timertext.val).padding(.top, 8)
            
            Spacer()
            
            HStack {
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) { Image(systemName: "power") }
                
                Spacer()
                
                Button(action: {
                    print("Pause")
                    paused = !paused
                }) { Image(systemName: paused ? "play.fill" : "pause.fill") }
                
                Button(action: {
                    print("Restart")
                }) { Image(systemName: "stop.fill") }
                
            }.padding(.bottom, 8).padding(.horizontal, 5)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TimerBlock: View {
    var value = ""
    
    init(_ val: String) {
        self.value = val
    }
    
    var body: some View {
        HStack {
            VStack {
                if value == "" {
                    Text("type something").foregroundColor(Color.init(white: 0.75))
                } else {
                    Text(value)
                }
                Text("")
            }.padding(5).padding(.horizontal,10)
            
            Spacer()
        }
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            }.padding(.horizontal, 8)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
