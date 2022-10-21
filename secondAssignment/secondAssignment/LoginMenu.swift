//
//  ViewController.swift
//  secondAssignment
//
//  Created by saint on 2022/10/11.
//

import UIKit
import SnapKit

final class LoginMenu: UIViewController {
    
    private let startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 90, y: 120, width: UIScreen.main.bounds.width - 60, height: 40))
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let introLabel: UILabel = {
        
        let label = UILabel(frame: CGRect(x: 45, y: 170, width: 300, height: 40 ))
        label.numberOfLines = 2
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private let emailPhoneTextField: KakaoCustomView = {
        let textField = KakaoCustomView(frame: CGRect(x: 45, y: 250, width: 300, height: 40))
        return textField
    }()
    
    private let passwordTextField: KakaoCustomView = {
        let textField = KakaoCustomView(frame: CGRect(x: 45, y: 300, width: 300, height: 40))
        return textField
    }()
    
    private func config(){
        emailPhoneTextField.dataBind(placeholder: "이메일 또는 전화번호")
        passwordTextField.dataBind(placeholder: "비밀번호")
    }
    
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 365, width: 300, height: 40))
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(presentToCheckAccount), for: .touchUpInside)
        return button
    }()
    
    private let newAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 415, width: 300, height: 40))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray5
        //self는 어디서든 main class를 가리킨다.
        button.addTarget(self, action: #selector(pushToNewAccount), for: .touchUpInside)
        return button
    }()
    
    private let findAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 465, width: 300, height: 30))
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        layout()
        
        let components: [Any] = [startLabel, introLabel, emailPhoneTextField, passwordTextField, loginButton, newAccountButton, findAccountButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
}


extension LoginMenu{
    
    private func layout(){
        [startLabel, introLabel, emailPhoneTextField, passwordTextField, loginButton, newAccountButton, findAccountButton].forEach{
            view.addSubview($0)
        }
        
        startLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            
        }
        
        introLabel.snp.makeConstraints{
            $0.top.equalTo(self.startLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        emailPhoneTextField.snp.makeConstraints{
            $0.top.equalTo(self.introLabel.snp.bottom).offset(60)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(49)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.top.equalTo(self.emailPhoneTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(49)
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(35)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(44)
        }
        
        newAccountButton.snp.makeConstraints{
            $0.top.equalTo(self.loginButton.snp.bottom).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(44)
        }
        
        findAccountButton.snp.makeConstraints{
            $0.top.equalTo(self.newAccountButton.snp.bottom).offset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(29)
        }
        
        
    }
    
    
    @objc
    private func pushToNewAccount(){
        let na = NewAccount()
        self.navigationController?.pushViewController(na, animated: true)
    }
    
    @objc
    private func presentToCheckAccount(){
        let ca = CheckAccount()
        ca.modalPresentationStyle = .fullScreen
        self.present(ca, animated: true, completion: nil) // animated : true -> 애니메이션을 보이게 하기; completion : 종료 후에 실행할 작업, closer 활용하기
        
        if let answer = emailPhoneTextField.nameTextField.text{
            ca.showText(email: answer)
        }
    }
}


