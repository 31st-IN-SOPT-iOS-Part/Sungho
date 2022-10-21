//
//  CheckAccount.swift
//  first assignment
//
//  Created by saint on 2022/10/03.
//

import UIKit

class CheckAccount: UIViewController {
    
    private let helloLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 45, y: 300, width: 300, height: 60))
        label.numberOfLines = 2
        label.text = "000님\n환영합니다"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let acceptButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 45, y: 415, width: 300, height: 40))
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(touchupOkayButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let components: [Any] = [helloLabel, acceptButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
    
    func showText(email: String){
        helloLabel.text = "당신의 선택은 \(email)였군요!"
    }
    
    @objc
    private func touchupOkayButton(){
        if self.navigationController == nil{
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }


}
