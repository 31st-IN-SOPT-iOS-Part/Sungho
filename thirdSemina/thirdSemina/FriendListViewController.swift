//
//  MusicListViewController.swift
//  thirdSemina
//
//  Created by saint on 2022/10/15.
//

import UIKit

import SnapKit
import SwiftyColor

// MARK: - MusicListViewController

final class FriendListViewController: UIViewController {

    // MARK: - UI Components
    
    private let tableHeaderView = UIView()
    
    private lazy var friendListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private let friendLabel: UILabel = {
        let label = UILabel()
        label.text = "친구"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private lazy var setButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        return button
    }()
    
    private let myProfileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "myProfileImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let myName: UILabel = {
        let label = UILabel()
        label.text = "배성호"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let myProfileMessage: UILabel = {
        let label = UILabel()
        label.text = "오늘도 과제중,,,ㅎㅅㅎ"
        label.font = .boldSystemFont(ofSize: 11)
        label.textColor = .systemGray2
        return label
    }()
    
    private let line: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 343.adjusted, height: 1))
        view.backgroundColor = .systemGray4
        return view
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
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        layout()
        configImage()
    }
}

// MARK: - Extensions

extension FriendListViewController {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [friendListTableView, friendLabel, setButton].forEach{
            view.addSubview($0)
        }
        
        friendListTableView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(52.adjusted)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.height.equalTo((50 * profileList.count + 73).adjusted)
        }
        
        friendLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15.adjusted)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(14.adjusted)
        }
        
        setButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(17.adjusted)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15.adjusted)
        }
        headerViewLayout()
    }
    
    // MARK: - General Helpers
    
    private func register() {
        friendListTableView.register(ProfileTableViewCell.self,
                                forCellReuseIdentifier: ProfileTableViewCell.identifier
        )
    }
    
    // MARK: - Put Button Images
    private func configImage() {
        setButton.setBackgroundImage(UIImage(named: "iconSetting"), for: .normal)
    }
    
    // tableview 위에 headerviewlayout을 잡아서 나의 프로필을 삽입한다.
    private func headerViewLayout() {
        tableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        friendListTableView.tableHeaderView = tableHeaderView
            tableHeaderView.backgroundColor = .white
        
        [myProfileImage, myName, myProfileMessage, line].forEach{
            tableHeaderView.addSubview($0)
        }
        myProfileImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(7.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
            $0.width.height.equalTo(58.adjusted)
        }
        myName.snp.makeConstraints{
            $0.top.equalToSuperview().offset(19.adjusted)
            $0.leading.equalTo(myProfileImage.snp.trailing).offset(11.adjusted)
        }
        myProfileMessage.snp.makeConstraints{
            $0.top.equalTo(myName.snp.bottom).offset(6.adjusted)
            $0.leading.equalTo(myName)
        }
        line.snp.makeConstraints{
            $0.top.equalTo(myProfileImage.snp.bottom).offset(7.adjusted)
            $0.leading.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        NSLayoutConstraint.activate([
            tableHeaderView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            tableHeaderView.heightAnchor.constraint(equalToConstant: 73.adjusted)
        ])
        tableHeaderView.layoutIfNeeded()
    }
    //;;
}

// MARK: - UITableViewDelegate

extension FriendListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.adjusted
    }
}

// MARK: - UITableViewDataSource

extension FriendListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let profileCell = tableView.dequeueReusableCell(
            withIdentifier: ProfileTableViewCell.identifier, for: indexPath)
                as? ProfileTableViewCell else { return UITableViewCell() }
        
        profileCell.dataBind(model: profileList[indexPath.row])
        return profileCell
    }
}

extension Int {
    var adjusted: CGFloat {
        let ratio: CGFloat = CGFloat(UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = CGFloat(UIScreen.main.bounds.height) / 667
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

extension Double {
    var adjusted: CGFloat {
        let ratio: CGFloat = CGFloat(UIScreen.main.bounds.width) / 375
        let ratioH: CGFloat = CGFloat(UIScreen.main.bounds.height) / 667
        return ratio <= ratioH ? CGFloat(self) * ratio : CGFloat(self) * ratioH
    }
}

