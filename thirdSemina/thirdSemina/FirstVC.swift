//
//  ViewController.swift
//  thirdSemina
//
//  Created by saint on 2022/10/15.
//

import UIKit

class ViewController: UIViewController {

    private lazy var answerTextField: UITextField = {
            let textField = UITextField(frame: CGRect(x: 80, y: 280, width: 250, height: 40))
            textField.borderStyle = .roundedRect
            textField.backgroundColor = .systemGray6
            textField.font = .systemFont(ofSize: 18, weight: .medium)
            textField.delegate = self
            return textField
        }()
    }


}

