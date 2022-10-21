//
//  KakaoCustomView.swift
//  secondAssignment
//
//  Created by saint on 2022/10/11.
//

import UIKit
import SnapKit

class KakaoCustomView: UIView {

    let nameTextField: UITextField = {
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
        layout()
        
        [nameTextField, underLineView].forEach {
            self.addSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("iniaat(coder:) has not been implemented")
    }
    
    func dataBind(placeholder: String) {
        nameTextField.placeholder = placeholder
    }
}

extension KakaoCustomView{
    
    private func layout(){
        
        [nameTextField, underLineView].forEach{
            self.addSubview($0)
        }
        
        nameTextField.snp.makeConstraints{make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(48)
        }
        
        underLineView.snp.makeConstraints{
            $0.top.equalTo(self.nameTextField.snp.bottom)
            $0.leading.equalTo(self.snp.leading)
            $0.trailing.equalTo(self.snp.trailing)
            $0.height.equalTo(1)
        }
        
    }
}


