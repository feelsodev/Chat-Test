//
//  ViewController.swift
//  Chat-Test
//
//  Created by once on 2020/10/03.
//

import UIKit
import Starscream
import Then
import SwiftKeychainWrapper

class ViewController: UIViewController, WebSocketDelegate {
    
    var socket: WebSocket!
    var isConnected = false
    var sendMessage = UIButton().then {
        $0.setTitle("보내기!!", for: .normal)
        $0.backgroundColor = .darkGray
        $0.addTarget(self, action: #selector(writeText), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
        var request = URLRequest(url: URL(string: "ws://ec2-13-124-151-24.ap-northeast-2.compute.amazonaws.com:9999")!)
        request.timeoutInterval = 5
        let retrievedString: String? = KeychainWrapper.standard.string(forKey: "device_id")
        print(retrievedString!)
//        print(UIDevice.current.identifierForVendor?.uuidString)
//        socket = WebSocket(request: request)
//        socket.delegate = self
//        socket.connect()
    }
    
    // MARK: - WebSocketDelegate
    func websocketDidConnect(socket: WebSocketClient) {
//        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected!")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("\(text)라는 메세지가 왔습니다.")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
    
    func handleError(_ error: Error?) {
        if let e = error as? WSError {
            print("websocket encountered an error: \(e.message)")
        } else if let e = error {
            print("websocket encountered an error: \(e.localizedDescription)")
        } else {
            print("websocket encountered an error")
        }
    }
    
    func layout() {
        view.addSubview(sendMessage)

        
        sendMessage.do {
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    // MARK: Write Text Action
    @objc func writeText() {
        socket.write(string: "재인재인")
    }
    
    // MARK: Disconnect Action
    @IBAction func disconnect(_ sender: UIBarButtonItem) {
        if isConnected {
            sender.title = "Connect"
            socket.disconnect()
        } else {
            sender.title = "Disconnect"
            socket.connect()
        }
    }
    
}
