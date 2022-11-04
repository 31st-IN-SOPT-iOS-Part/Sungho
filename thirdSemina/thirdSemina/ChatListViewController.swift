//
//  MusicGridViewController.swift
//  thirdSemina
//
//  Created by saint on 2022/10/15.
//

import UIKit

import SnapKit
import SwiftyColor
import Then

// MARK: - MusicGridViewController

final class ChatListViewController: UIViewController {

    // MARK: - UI Components
    
    private lazy var profileCollectionView: UICollectionView = {
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
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "채팅"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let openchatLabel: UILabel = {
        let label = UILabel()
        label.text = "오픈채팅"
        label.textColor = .systemGray2
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - presentToRecentImage (버튼 클릭시 화면 present)
    private func presentToRecentImg() {
        let recentImg = RecentImageViewController()
        recentImg.modalPresentationStyle = .currentContext
        
        self.present(recentImg, animated: true, completion: nil)
    }
    
    @objc
    private func touchupNextButton() {
      presentToRecentImg()
    }
    // ...;;
    
    private lazy var setButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var advertImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "brandingImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    // MARK: - Variables
    
    var profileList: [ProfileModel] = [
        ProfileModel(profileImage: "profileImage1", name: "안솝트", profileMessage: "대학생의 삶.."),
        ProfileModel(profileImage: "profileImage2", name: "최솝트", profileMessage: "과제가 두배?"),
        ProfileModel(profileImage: "profileImage3", name: "정솝트", profileMessage: "학교 과제 싫어요ㅠ"),
        ProfileModel(profileImage: "profileImage4", name: "강솝트", profileMessage: "솝트 과제만 할랭"),
        ProfileModel(profileImage: "profileImage5", name: "오솝트", profileMessage: "곱창에 쏘주 먹고 싶다"),
        ProfileModel(profileImage: "profileImage6", name: "황솝트", profileMessage: "곱쏘곱쏘"),
        ProfileModel(profileImage: "profileImage7", name: "최솝트", profileMessage: "그전에 테이블뷰부터,,"),
        ProfileModel(profileImage: "profileImage8", name: "고솝트", profileMessage: "아직 갈길이 멀다,,"),
        ProfileModel(profileImage: "profileImage9", name: "하솝트", profileMessage: "아요 화이팅,,,"),
        ProfileModel(profileImage: "profileImage1", name: "안솝트", profileMessage: "대학생의 삶.."),
        ProfileModel(profileImage: "profileImage2", name: "최솝트", profileMessage: "과제가 두배?"),
        ProfileModel(profileImage: "profileImage3", name: "정솝트", profileMessage: "학교 과제 싫어요ㅠ"),
        ProfileModel(profileImage: "profileImage4", name: "강솝트", profileMessage: "솝트 과제만 할랭"),
        ProfileModel(profileImage: "profileImage5", name: "오솝트", profileMessage: "곱창에 쏘주 먹고 싶다"),
    ]
    
    // MARK: - Constants
    
    final let friendListInset: UIEdgeInsets = UIEdgeInsets()
    final let friendListLineSpacing: CGFloat = 0
    final let kCellHeight: CGFloat = 50
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configImage()
        register()
    }
}

// MARK: - Extensions

extension ChatListViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [profileCollectionView, chatLabel, openchatLabel, setButton, plusButton].forEach{
            view.addSubview($0)
        }
        profileCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(52.adjusted)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(calculateCellHeight())
        }
        // header에 이미지 삽입
        profileCollectionView.addSubview(advertImage)
        advertImage.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343.adjusted)
            $0.height.equalTo(71.06.adjusted)
        }
        
        chatLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(15.adjusted)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(14.adjusted)
        }
        
        openchatLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(15.adjusted)
            $0.leading.equalTo(self.chatLabel.snp.trailing).offset(7.adjusted)
        }
        
        setButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(17.adjusted)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-15.adjusted)
        }
        
        plusButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(17.adjusted)
            $0.trailing.equalTo(self.setButton.snp.leading).offset(-12.adjusted)
        }
        view.backgroundColor = .white
    }

    private func configImage() {
        setButton.setBackgroundImage(UIImage(named: "iconSetting"), for: .normal)
        plusButton.setBackgroundImage(UIImage(named: "iconPlus"), for: .normal)
    }
    
    private func register() {
        profileCollectionView.register(
            ProfileCollectionViewCell.self,
            forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier
        )
    }
    
    // MARK: - General Helpers
    
    private func calculateCellHeight() -> CGFloat {
        let count = CGFloat(profileList.count)
        return count * kCellHeight + (count - 1) * friendListLineSpacing + friendListInset.top + friendListInset.bottom
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let CellWidth = screenWidth - friendListInset.left - friendListInset.right
        return CGSize(width: CellWidth, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return friendListLineSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return friendListInset
    }
    
    // MARK: collectionview에 header를 만들어주기 위해 사용
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            let width: CGFloat = collectionView.frame.width
            let height: CGFloat = 79.adjusted
            return CGSize(width: width, height: height)
    }
}

// MARK: -UICollectionViewDataSource

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let profileCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath)
                as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        profileCell.dataBind(model: profileList[indexPath.item])
        return profileCell
    }
}
