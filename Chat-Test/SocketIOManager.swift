//
//  SocketManager.swift
//  Chat-Test
//
//  Created by once on 2020/10/16.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let shared = SocketIOManager()
    
    let manager = SocketManager(socketURL: URL(string: "wss://echo.websocket.org")!, config: [.log(true), .compress])
    var socket: SocketIOClient!
    
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/test")
        onConnect()
    }
    
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }

    func onConnect() {
        socket.on("test") { data, ack in
            print("\(data)!!!!!")
        }
    }
    func sendMessage() {
        let data = "TestString".data(using: .utf8, allowLossyConversion: false)!
        socket.emit("event", data)
    }
    
}
