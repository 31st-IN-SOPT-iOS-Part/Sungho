//
//  FriendList.swift
//  secondAssignment
//
//  Created by saint on 2022/10/13.
//

import UIKit
import SnapKit

class FriendList: UIViewController {
    
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private lazy var setButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(touchupProfileButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        configButton()
        
        let components: [Any] = [friendLabel, setButton, profileButton]
        components.forEach{
            view.addSubview($0 as! UIView)
        }
    }
    
    @objc
    private func touchupProfileButton(){
        let ps = ProfileScreen()
        ps.modalPresentationStyle = .fullScreen
        self.present(ps, animated: true, completion: nil) // animated : true -> 애니메이션을 보이게 하기; completion : 종료 후에 실행할 작업, closer 활용하기
    }
        
}


extension FriendList{
    
    private func layout(){
        [friendLabel, setButton, profileButton].forEach{
            view.addSubview($0)
        }
        
        friendLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(56.adjusted)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(14.adjusted)
        }
        
        setButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(57.adjusted)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(57.adjusted)
            $0.width.equalTo(21.adjusted)
            $0.height.equalTo(21.adjusted)
        }
        
        profileButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(108.adjusted)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(14.adjusted)
            $0.width.equalTo(59.adjusted)
            $0.height.equalTo(58.adjusted)
        }
    }
    
    private func configButton() {
        setButton.setBackgroundImage(UIImage(named: "settings 1"), for: .normal)
        profileButton.setBackgroundImage(UIImage(named: "friendtab_profileImg"), for: .normal)
    }
}

