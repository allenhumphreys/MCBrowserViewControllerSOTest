//
//  ViewController.swift
//  TestApp
//
//  Created by Allen Humphreys on 2/7/18.
//  Copyright © 2018 Slalom, LLC. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController {

    var textField: UITextField?
    let id = MCPeerID(displayName: "testpeer")
    lazy var session = MCSession(peer: id)

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let controller = MCBrowserViewController(serviceType: "test", session: session)
        present(controller, animated: true)
        controller.delegate = self
    }
}

extension ViewController: MCBrowserViewControllerDelegate {

    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        self.presentedViewController?.dismiss(animated: true)
    }

    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        self.presentedViewController?.dismiss(animated: true)
    }
}
