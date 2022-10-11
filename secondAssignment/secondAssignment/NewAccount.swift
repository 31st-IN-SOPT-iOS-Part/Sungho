//
//  NewAccount.swift
//  secondAssignment
//
//  Created by saint on 2022/10/11.
//

import UIKit

class NewAccount: UIViewController {
    
    private let startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 90, y: 120, width: 400, height: 40))
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 24, weight: .bold)
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
    
    private let passwordCheckTextField: KakaoCustomView = {
        let textField = KakaoCustomView(frame: CGRect(x: 45, y: 350, width: 300, height: 40))
        return textField
    }()
    
    private func config(){
        emailPhoneTextField.dataBind(placeholder: "이메일 또는 전화번호")
        passwordTextField.dataBind(placeholder: "비밀번호")
        passwordCheckTextField.dataBind(placeholder: "비밀번호 확인")
    }
    
    private let newAccountButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 415, width: 300, height: 40))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(presentToCheckAccount), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        config()
        layout()
        
        let components: [Any] = [startLabel, emailPhoneTextField, passwordTextField, passwordCheckTextField, newAccountButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
    
    @objc
    private func presentToCheckAccount(){
        let ca = CheckAccount()
        ca.modalPresentationStyle = .fullScreen
        self.present(ca, animated: true, completion: {
            self.navigationController?.popViewController(animated: true)
        }) // animated : true -> 애니메이션을 보이게 하기; completion : 종료 후에 실행할 작업, closer 활용하기
        
        if let answer = emailPhoneTextField.nameTextField.text{
            ca.showText(email: answer)
        }
        
    }
    
}

extension NewAccount{
    
    private func layout(){
        [startLabel, emailPhoneTextField, passwordTextField, passwordCheckTextField, newAccountButton].forEach{
            view.addSubview($0)
        }
        
        startLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide)
            
        }
        
        emailPhoneTextField.snp.makeConstraints{
            $0.top.equalTo(self.startLabel.snp.bottom).offset(116)
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
        
        passwordCheckTextField.snp.makeConstraints{
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(10)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(49)
        }
        
        newAccountButton.snp.makeConstraints{
            $0.top.equalTo(self.passwordCheckTextField.snp.bottom).offset(26)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(21)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-21)
            $0.height.equalTo(44)
        }
    }
}
