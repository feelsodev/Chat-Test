//
//  FirebaseDataService.swift
//  Chat-Test
//
//  Created by once on 2020/10/04.
//

import Foundation
import Firebase

fileprivate let baseRef = Database.database().reference()

class FirebaseDataService {
    static let instance = FirebaseDataService()
        
        // 특정 데이터들이 저장되는 장소에 대한 레퍼런스
        // user : 특정 사용자
        let userRef = baseRef.child("user")
        
        // group : 채팅방 하나 단위
        let groupRef = baseRef.child("group")
        
        // message : 채팅 말풍선 하나 단위
        let messageRef = baseRef.child("message")
        
        // 현재 접속중인 유저의 uid
//        var currentUserUid: String? {
//            get {
//                guard let uid = FIRAuth.auth()?.currentUser?.uid else {
//                    return nil
//                }
//                return uid
//            }
//        }
}
