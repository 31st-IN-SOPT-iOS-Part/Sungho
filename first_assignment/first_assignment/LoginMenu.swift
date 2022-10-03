//
//  MainAccount.swift
//  first assignment
//
//  Created by saint on 2022/10/03.
//

import UIKit

class LoginMenu: UIViewController {
    
    private let startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 90, y: 120, width: 400, height: 40))
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let introLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 180, width: 300, height: 40))
        label.numberOfLines = 2
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private let emailPhoneTextField: KakaoCustomView = {
        let textField = KakaoCustomView(frame: CGRect(x: 40, y: 250, width: 300, height: 40))
        return textField
    }()
    
    private let passwordTextField: KakaoCustomView = {
        let textField = KakaoCustomView(frame: CGRect(x: 40, y: 300, width: 300, height: 40))
        return textField
    }()
    
    private func config(){
        emailPhoneTextField.dataBind(placeholder: "이메일 또는 전화번호")
        passwordTextField.dataBind(placeholder: "비밀번호")
    }
    
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 360, width: 300, height: 40))
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private let newAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 410, width: 300, height: 40))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    private let findAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 40, y: 460, width: 300, height: 30))
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.backgroundColor = .systemGray5
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        
        let components: [Any] = [startLabel, introLabel, emailPhoneTextField, passwordTextField, loginButton, newAccountButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
       
    }

}
