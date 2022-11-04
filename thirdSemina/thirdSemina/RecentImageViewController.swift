//
//  RecentImages.swift
//  thirdSemina
//
//  Created by saint on 2022/11/04.
//

import UIKit

import SnapKit

class RecentImageViewController: UIViewController {

    // MARK: - UI Components
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(named: "iconClose"), for: .normal)
        button.addTarget(self, action: #selector(touchupDeleteButton), for: .touchUpInside)
        return button
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.text = "최근 항목"
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private let sendLabel: UILabel = {
        let label = UILabel()
        label.text = "전송"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    
    private lazy var recentImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Variables
    
    var imageList: [ImageModel] = [
        ImageModel(recentImage: "galleryImage0"), ImageModel(recentImage: "galleryImage1"),
        ImageModel(recentImage: "galleryImage2"), ImageModel(recentImage: "galleryImage3"),
        ImageModel(recentImage: "galleryImage4"), ImageModel(recentImage: "galleryImage5"),
        ImageModel(recentImage: "galleryImage6"), ImageModel(recentImage: "galleryImage7"),
        ImageModel(recentImage: "galleryImage8"), ImageModel(recentImage: "galleryImage9"),
        ImageModel(recentImage: "galleryImage10"), ImageModel(recentImage: "galleryImage11"),
        ImageModel(recentImage: "galleryImage12"), ImageModel(recentImage: "galleryImage13"),
        ImageModel(recentImage: "galleryImage14"), ImageModel(recentImage: "galleryImage15"),
        ImageModel(recentImage: "galleryImage16"), ImageModel(recentImage: "galleryImage17"),
        ImageModel(recentImage: "galleryImage18"), ImageModel(recentImage: "galleryImage19"),
        ImageModel(recentImage: "galleryImage20"), ImageModel(recentImage: "galleryImage21"),
        ImageModel(recentImage: "galleryImage22"), ImageModel(recentImage: "galleryImage23"),
    ]
    
    // MARK: - Constants
    
    final let imgInset: UIEdgeInsets = UIEdgeInsets(top: 38, left: 0, bottom: 0, right: 0)
    final let imgLineSpacing: CGFloat = 7.adjusted
    final let imgInterItemSpacing: CGFloat = 9.adjusted
    final let imgCellHeight: CGFloat = 123.adjusted
    
    @objc
    private func touchupDeleteButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
    }
}

// MARK: - Extensions

extension RecentImageViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [recentImageCollectionView, deleteButton, itemLabel, sendLabel].forEach{
            view.addSubview($0)
        }
        recentImageCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
        deleteButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(7.adjusted)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(12.adjusted)
            $0.height.width.equalTo(24.adjusted)
        }
        itemLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(11.adjusted)
            $0.centerX.equalTo(self.view.safeAreaLayoutGuide)
        }
        sendLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(11.adjusted)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-10.adjusted)
        }
        
        
    }
    
    // MARK: - General Helpers
    
    private func register() {
        recentImageCollectionView.register(
            RecentImageViewCell.self,
            forCellWithReuseIdentifier: RecentImageViewCell.identifier
        )
    }

    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(imageList.count)
        let heightCount = count / 3 + count.truncatingRemainder(dividingBy: 3)
        return heightCount * imgCellHeight + (heightCount - 1) * imgLineSpacing + imgInset.top + imgInset.bottom
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension RecentImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let tripleCellWidth = screenWidth - imgInset.left - imgInset.right - imgInterItemSpacing * 2
        return CGSize(width: tripleCellWidth / 3, height: 123.adjusted)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return imgLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return imgInterItemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return imgInset
    }
}

// MARK: -UICollectionViewDataSource

extension RecentImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let imageCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RecentImageViewCell.identifier, for: indexPath)
                as? RecentImageViewCell else { return UICollectionViewCell() }
        imageCell.dataBind(model: imageList[indexPath.item])
        return imageCell
    }
}
