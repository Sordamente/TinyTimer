//
//  ContentView.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @State var time = "00:00:00"
    
    var body: some View {
        VStack {
            Text(time).font(.largeTitle).padding(.all, 8).foregroundColor(time == "00:00:00" ? Color.gray : Color.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
