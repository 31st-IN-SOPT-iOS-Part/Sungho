//
//  ProfileTableViewCell.swift
//  thirdSemina
//
//  Created by saint on 2022/10/15.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

// MARK: - MusicTableViewCell

final class ProfileTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ProfileTableViewCell"

    // MARK: - UI Components
    
    private let profileContainerView = UIView()
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel().then {
        $0.textColor = 0x191919.color
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    private let profileMessageLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11, weight: .medium)
    }

    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Extensions

extension ProfileTableViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        [profileContainerView, nameLabel, profileMessageLabel].forEach {
            contentView.addSubview($0)
        }
        
        profileContainerView.addSubview(profileImageView)
        profileContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16.adjusted)
            $0.width.height.equalTo(44.adjusted)
        }
        
        profileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10.adjusted)
            $0.leading.equalTo(profileContainerView.snp.trailing).offset(11.adjusted)
        }
        
        profileMessageLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3.adjusted)
            $0.leading.equalTo(nameLabel)
        }
    }
    // MARK: - General Helpers
    
    func dataBind(model: ProfileModel) {
        nameLabel.text = model.name
        profileMessageLabel.text = model.profileMessage
        profileImageView.image = UIImage(named: model.profileImage)
    }
}
