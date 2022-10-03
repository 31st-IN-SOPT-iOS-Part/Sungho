//
//  KakaoTextField.swift
//  first_assignment
//
//  Created by saint on 2022/10/03.
//

/// text field를 만들 때, 텍스트+밑줄을 한꺼번에 만드는 class
import UIKit

class KakaoCustomView: UIView {

    private let nameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 39))
        return textField
    }()
    
    private let underLineView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 39, width: 300, height: 1))
        view.backgroundColor = .systemGray4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [nameTextField, underLineView].forEach {
            self.addSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataBind(placeholder: String) {
        nameTextField.placeholder = placeholder
    }
}
