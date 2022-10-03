//
//  ViewController.swift
//  InSopt_First_Semina
//
//  Created by saint on 2022/10/01.
//

import UIKit

class ViewController: UIViewController {
    
    private let testLabel : UILabel = {
        let label = UILabel(frame:CGRect(x:100, y:400, width:300, height: 100))
        label.text = "아요미들 ☺︎"
        return label
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(testLabel)
        // Do any additional setup after loading the view.
    }


}


