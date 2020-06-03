//
//  ViewControllerScreen.swift
//  ShimmerSample
//
//  Created by Victor Oka on 02/06/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class ViewControllerScreen: UIView {
    
    // MARK: - Screen Components
    private var maskingViews = [UIView]()
    
    private var skeletonView: SkeletonView = {
        let view = SkeletonView(frame: .zero)
        return view
    }()
    
    private lazy var cardView: UIView = {
        let card = UIView(frame: .zero)
        card.layer.cornerRadius = 14.0
        card.layer.shadowColor = UIColor.darkGray.cgColor
        card.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        card.layer.shadowRadius = 6.0
        card.layer.shadowOpacity = 0.6
        card.backgroundColor = .white
        return card
    }()
    
    private lazy var nameLabelMask: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var jobTitleLabelMask: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var locationLabelMask: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Black", size: 17)
        label.alpha = 0.0
        return label
    }()
    
    private lazy var jobTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Medium", size: 15)
        label.alpha = 0.0
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Medium", size: 15)
        label.alpha = 0.0
        return label
    }()
    
    private lazy var profileImageViewPlaceholder: UIView = {
        let imagePlaceholderView = UIView(frame: .zero)
        imagePlaceholderView.layer.masksToBounds = true
        imagePlaceholderView.layer.cornerRadius = 40
        return imagePlaceholderView
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
        return imageView
    }()
    
    private lazy var fetchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Load Profile", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(loadProfile), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
        layoutIfNeeded()
        maskingViews.append(nameLabelMask)
        maskingViews.append(jobTitleLabelMask)
        maskingViews.append(locationLabelMask)
        maskingViews.append(profileImageViewPlaceholder)
        skeletonView.setMaskingViews(for: maskingViews)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button Action
    @objc func loadProfile(sender: UIButton!) {
        skeletonView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.nameLabel.text = "Victor Hideo Oka"
            self.jobTitleLabel.text = "iOS Developer"
            self.locationLabel.text = "São Paulo - Brazil"
            self.skeletonView.stopAnimating()
            self.skeletonView.layer.mask = nil
            
            UIView.animate(withDuration: 0.5, animations: {
                self.nameLabel.alpha = 1.0
                self.jobTitleLabel.alpha = 1.0
                self.locationLabel.alpha = 1.0
                self.profileImageView.image = UIImage(named: "itachi.jpg")
            })
        }
    }
}

// MARK: - Code View Protocol
extension ViewControllerScreen: CodeView {
    
    func buildViewHierarchy() {
        skeletonView.addSubview(nameLabelMask)
        skeletonView.addSubview(jobTitleLabelMask)
        skeletonView.addSubview(locationLabelMask)
        skeletonView.addSubview(profileImageViewPlaceholder)
        
        skeletonView.addSubview(nameLabel)
        skeletonView.addSubview(jobTitleLabel)
        skeletonView.addSubview(locationLabel)
        skeletonView.addSubview(profileImageView)
        
        cardView.addSubview(skeletonView)
        addSubview(cardView)
        addSubview(fetchButton)
    }
    
    func setupConstraints() {
        cardView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).inset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        skeletonView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.centerY.equalToSuperview()
        }
        
        profileImageViewPlaceholder.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageViewPlaceholder.snp.top)
            make.left.equalTo(profileImageViewPlaceholder.snp.right).offset(12)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
        
        nameLabelMask.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameLabel.snp.centerY)
            make.left.equalTo(nameLabel.snp.left)
            make.width.equalTo(160)
            make.height.equalTo(15)
        }
        
        jobTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(12)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
        
        jobTitleLabelMask.snp.makeConstraints { (make) in
            make.centerY.equalTo(jobTitleLabel.snp.centerY)
            make.left.equalTo(jobTitleLabel.snp.left)
            make.width.equalTo(215)
            make.height.equalTo(15)
        }
        
        locationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(jobTitleLabel.snp.bottom).offset(10)
            make.left.equalTo(profileImageView.snp.right).offset(12)
            make.right.equalToSuperview().inset(8)
            make.height.equalTo(20)
        }
        
        locationLabelMask.snp.makeConstraints { (make) in
            make.centerY.equalTo(locationLabel.snp.centerY)
            make.left.equalTo(locationLabel.snp.left)
            make.width.equalTo(175)
            make.height.equalTo(15)
        }
        
        fetchButton.snp.makeConstraints { (make) in
            make.top.equalTo(cardView.snp.bottom).offset(150)
            make.left.equalToSuperview().offset(70)
            make.right.equalToSuperview().inset(70)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {
        backgroundColor = .white
    }
    
}
