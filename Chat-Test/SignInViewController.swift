//
//  SignInViewController.swift
//  Chat-Test
//
//  Created by once on 2020/10/04.
//

import UIKit

class SignInViewController: UIViewController {
    
    let chatViewController = ViewController()
    
    func openChattingView() {
        performSegue(withIdentifier: "chattingRooms", sender: nil)
    }
    
    @IBAction func swdorizButtonTapped(_ sender: UIButton) {
        FirebaseDataService.instance.signIn(withEmail: "swdoriz@gmail.com", password: "1234a") {
            self.openChattingView()
        }
    }
    
    @IBAction func swyoonButtonTapped(_ sender: UIButton) {
        FirebaseDataService.instance.signIn(withEmail: "swyoon9574@naver.com", password: "1234a") {
            self.openChattingView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
