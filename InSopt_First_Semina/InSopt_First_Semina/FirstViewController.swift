//
//  FirstViewController.swift
//  InSopt_First_Semina
//
//  Created by saint on 2022/10/01.
//

import UIKit

class FirstViewController: UIViewController {

    private let questionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 200, width: 250, height: 30))
        label.text = "민초 vs 반민초 당신의 선택은?"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let answerTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 80, y: 280, width: 250, height: 40))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        textField.font = .systemFont(ofSize: 18, weight: .medium) //uifont는 자명하므로 생략
        return textField
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x:80, y:350, width: 250, height: 42))
        button.setTitle("다음으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [questionLabel, answerTextField, nextButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
    
    private func presentToSecondVC(){
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .formSheet
        secondVC.result = answerTextField.text
        self.present(secondVC, animated: true)
    }
    
    private func pushToSecondVC(){
        let secondVC = SecondViewController()
        secondVC.result = answerTextField.text
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc
    private func touchupNextButton(){
        pushToSecondVC()
//        presentToSecondVC()
    }
    
}
