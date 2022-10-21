//
//  ProfileScreen.swift
//  secondAssignment
//
//  Created by saint on 2022/10/13.
//

import UIKit
import SnapKit

class ProfileScreen: UIViewController {
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(touchupDeleteButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        return button
    }()
    
    private let divisionLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "배성호"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let chatButton: TouchButtonView = {
        let button = TouchButtonView()
        button.backgroundColor = .clear
        return button
    }()
    
    private let editProfile: TouchButtonView = {
        let button = TouchButtonView()
        button.backgroundColor = .clear
        return button
    }()
    
    private let kakaoStory: TouchButtonView = {
        let button = TouchButtonView()
        button.backgroundColor = .clear
        return button
    }()
    
    private func config(){
        chatButton.dataBind(text: "나와의 채팅", image: "profileTalkImg")
        editProfile.dataBind(text: "프로필 편집", image: "profile_editImg")
        kakaoStory.dataBind(text: "카카오스토리", image: "profileStoryImg")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.537, green: 0.569, blue: 0.592, alpha: 1.0)
        
        layout()
        configButton()
        config()
    }
    
    @objc
    private func touchupDeleteButton(){
            self.dismiss(animated: true, completion: nil)
        }
}

extension ProfileScreen{
    
    private func layout(){
        [deleteButton, profileButton, divisionLine, nameLabel, chatButton, editProfile, kakaoStory].forEach{
            view.addSubview($0)
        }
        
        deleteButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(58.adjusted)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(18.adjusted)
            make.width.equalTo(13.adjusted)
            make.height.equalTo(14.adjusted)
        }
        
        profileButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(514.adjusted)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(97.adjusted)
            $0.height.equalTo(96.adjusted)
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(self.profileButton.snp.bottom).offset(8.adjusted)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        divisionLine.snp.makeConstraints{
            $0.top.equalToSuperview().offset(681.adjusted)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(0.4.adjusted)
        }
        
        editProfile.snp.makeConstraints{
            $0.top.equalToSuperview().offset(692.adjusted)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(141.67.adjusted)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-140.67.adjusted)
            $0.bottom.equalToSuperview().inset(48.adjusted)
        }
        
        chatButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(692.adjusted)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(49.adjusted)
            $0.trailing.equalTo(self.editProfile.snp.leading)
            $0.bottom.equalToSuperview().inset(48.adjusted)
        }
        
        kakaoStory.snp.makeConstraints{
            $0.top.equalToSuperview().offset(692.adjusted)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).inset(48.adjusted)
            $0.leading.equalTo(self.editProfile.snp.trailing)
            $0.bottom.equalToSuperview().inset(48.adjusted)
        }
    }
    
    private func configButton() {
        deleteButton.setBackgroundImage(UIImage(named: "profile_closeBtn"), for: .normal)
        profileButton.setBackgroundImage(UIImage(named: "profile_userImg"), for: .normal)
    }
}

extension Int {
    var adjusted: CGFloat {
        let ratio: CGFloat = CGFloat(UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = CGFloat(UIScreen.main.bounds.height) / 812
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

extension Double {
    var adjusted: CGFloat {
        let ratio: CGFloat = CGFloat(UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = CGFloat(UIScreen.main.bounds.height) / 812
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

