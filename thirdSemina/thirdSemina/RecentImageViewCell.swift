//
//  RecentImageViewCell.swift
//  thirdSemina
//
//  Created by saint on 2022/11/04.
//

import UIKit

import SnapKit

class RecentImageViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "RecentImageViewCell"
    
    // MARK: - UI Components
    
    private let imageContainerView = UIView()
    private let recentImageView = UIImageView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RecentImageViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(imageContainerView)
        
        imageContainerView.addSubview(recentImageView)
        imageContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        recentImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: ImageModel) {
        recentImageView.image = UIImage(named: model.recentImage)
    }
}

