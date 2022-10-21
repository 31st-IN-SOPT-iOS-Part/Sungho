//
//  TouchButton.swift
//  secondAssignment
//
//  Created by saint on 2022/10/14.
//

import UIKit
import SnapKit

class TouchButtonView: UIButton {

    private let infoLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let imageContainerView: UIImageView = {
            let view = UIImageView()
            view.backgroundColor = .clear
            return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        
        [infoLabel, imageContainerView].forEach {
            self.addSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("iniaat(coder:) has not been implemented")
    }
    
    func dataBind(text: String, image: String) {
        infoLabel.text = text
        infoLabel.font = .systemFont(ofSize: 10, weight: .medium)
        infoLabel.textColor = .white
        infoLabel.textAlignment = .center
        imageContainerView.image = UIImage(named: image)
        imageContainerView.contentMode = .scaleAspectFit
    }
}

extension TouchButtonView{
    
    private func layout(){
        
        [infoLabel, imageContainerView].forEach{
            self.addSubview($0)
        }
        
        imageContainerView.snp.makeConstraints{make in
            make.top.equalTo(self.snp.top).offset(20.adjusted)
            make.centerX.equalTo(self)
            make.leading.equalTo(self.snp.leading).offset(38.adjusted)
        }
        
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(self.snp.top).offset(48.adjusted)
            $0.centerX.equalTo(self)
            $0.leading.equalTo(self.snp.leading).offset(19.31.adjusted)
        }
    }
}

