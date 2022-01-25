//
//  AppDelegate.swift
//  TinyTimer
//
//  Created by Tomer Sedan on 4/9/21.
//

import Cocoa
import SwiftUI

var highlighted = false
var statusBarItem: NSStatusItem!
let contentView = ContentView()
var popover: NSPopover!

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var positioningView: NSView!
    var popoverDelegate: NSPopoverDelegate!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the popover that'll show the window contents
        contentView.handleKey(key: "abc")
        popover = NSPopover()
        popover.contentSize = NSSize(width: 130, height: 40)
        popover.contentViewController = NSHostingController(rootView: contentView)
        popover.behavior = .transient
        
        // Register the popover delegate and assign it to the popover
        popoverDelegate = customDelegate()
        popover.delegate = popoverDelegate
        
        // Initialize the status bar item
        statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        
        // Configure the menu bar button
        let button = statusBarItem.button!
        
        // MARK: This errors for some reason
        button.image = NSImage(named: "Icon")
        
        button.action = #selector(togglePopover(_:))
        button.sendAction(on: .leftMouseDown)
        button.identifier = NSUserInterfaceItemIdentifier("statusButton")
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        
        // We only want behavior when the popover is closed
        if !popover.isShown {
            
            // Fetch the button
            let button = statusBarItem.button!
            
            // Add a positioning view to the button to hide the popover arrow
            let positioningView = NSView(frame: button.bounds)
            button.addSubview(positioningView)
            
            // Show the popover
            popover.animates = false
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
            popover.animates = true

            // Move the button bounds to cover the arrow
            button.bounds = button.bounds.offsetBy(dx: 0, dy: button.bounds.height)
            
            if let popoverWindow = popover.contentViewController!.view.window {
                // Move the popover up a bit and make it the active view
                popoverWindow.setFrame(popoverWindow.frame.offsetBy(dx: 0, dy: 8), display: false)
                popoverWindow.makeKey()
            }
            
            // Force the button to redraw
            highlighted = true
            button.updateCell(button.cell!)
        }
        
    }

}

class customDelegate: NSObject, NSPopoverDelegate {
    
    // Reset the button when the popover prepares to close
    func popoverWillClose(_ notification: Notification) {
        let button = statusBarItem.button!
        
        // Remove the positioning view and reset the highlight
        button.subviews.first?.removeFromSuperview()
        highlighted = false
        
        // Force the button to redraw
        button.updateCell(button.cell!)
    }
    
}

extension NSButton {
    
    // Override the default drawing function for buttons
    override open func draw(_ dirtyRect: NSRect) {
        
        // Check if the button that is being drawn is the menu bar button
        if (self.identifier == NSUserInterfaceItemIdentifier("statusButton")) {
            if (self.isHighlighted != highlighted) {
                // If the highlight state is different than desired, change it
                self.highlight(highlighted)
            }
            
            // MARK: draw custom button
        }
        
        // Call the default draw function
        super.draw(dirtyRect)
    }
    
}
