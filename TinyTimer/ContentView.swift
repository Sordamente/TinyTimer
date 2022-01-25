//
//  ContentView.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var time = "00:00:00"
    
    var body: some View {
        VStack {
            Text(time).font(.largeTitle).padding(.all, 8).foregroundColor(time == "00:00:00" ? Color.gray : Color.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(KeyEventHandling())
    }
    
    func handleKey(key: String) {
        time = key
    }
}

struct KeyEventHandling: NSViewRepresentable {
    class KeyView: NSView {
        override var acceptsFirstResponder: Bool { true }
        override func keyDown(with event: NSEvent) {
            contentView.handleKey(key: event.charactersIgnoringModifiers ?? "")
            print(">> key \(event.charactersIgnoringModifiers ?? "")")
        }
    }

    func makeNSView(context: Context) -> NSView {
        let view = KeyView()
        DispatchQueue.main.async { // wait till next event cycle
            view.window?.makeFirstResponder(view)
        }
        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
