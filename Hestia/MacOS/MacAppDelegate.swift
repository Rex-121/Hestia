//
//  MacAppDelegate.swift
//  Hestia
//
//  Created by Tyrant on 2022/4/12.
//

#if os(macOS)
import Cocoa
import SwiftUI

class MacAppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem!
    
    let popover = NSPopover()
    
    private lazy var contentView: NSView? = {
        (statusItem.value(forKey: "window") as? NSWindow)?.contentView
    }()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        print("applicationDidFinishLaunching")
        setupMenuBar()
        setupPopover()
    }
    
}




extension MacAppDelegate {
    
    func setupMenuBar() {
        
        statusItem = NSStatusBar.system.statusItem(withLength: 64)
        
        guard let content = contentView,
              let menu = statusItem.button
        else { return }
        
        //        menu.title = "JSON"
        //
        //        menu.image = NSImage(systemSymbolName: "bonjour", accessibilityDescription: "")
        
        let hostingView = NSHostingView(rootView: MacTitleView())
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(hostingView)
        
        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: content.topAnchor),
            hostingView.rightAnchor.constraint(equalTo: content.rightAnchor),
            hostingView.bottomAnchor.constraint(equalTo: content.bottomAnchor),
            hostingView.leftAnchor.constraint(equalTo: content.leftAnchor)
        ])
        
        menu.action = #selector(didPressMenuButton)
    }
    
    
    @objc func didPressMenuButton() {
        if popover.isShown {
            popover.performClose(nil)
            return
        }
        
        guard let menu = statusItem.button else { return }
        
        popover.setValue(true, forKeyPath: "shouldHideAnchor")
        
        popover.show(relativeTo: menu.bounds, of: menu, preferredEdge: .maxY)
        
        popover.contentViewController?.view.window?.makeKey()
    }
    
    /**
     private func HideAnchor() {
     let position = NSView(frame: menu.bounds)
     
     position.identifier = NSUserInterfaceItemIdentifier("positionview")
     
     menu.addSubview(position)
     menu.bounds = menu.bounds.offsetBy(dx: 0, dy: menu.bounds.height)
     }
     */
}


extension MacAppDelegate {
    
    func setupPopover() {
        
        
        popover.behavior = .transient
        
        popover.animates = true
        
        popover.contentSize = .init(width: 300, height: 300)
        
        popover.contentViewController = NSViewController()
        
        popover.contentViewController?.view = NSHostingView(
            rootView:JSONInputView_Mac()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding())
    }
    
}

#endif
