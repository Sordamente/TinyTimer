//
//  Constants.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/14/21.
//

import KeyboardShortcuts

let validInputs = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM. "

extension KeyboardShortcuts.Name {
    static let toggleMenu = Self("toggleMenu", default: .init(.z, modifiers: [.command, .shift]))
}
