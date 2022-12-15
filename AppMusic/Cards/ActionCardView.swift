//
//  ActionCardView.swift
//  AppMusic
//
//  Created by Uchoas Santos, Joao Vitor on 15/12/22.
//

import UIKit

class ActionCardView: UIView {

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()

    lazy var downloadView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var notInterestedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var playView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var likeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var moreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()

    lazy var notInterestButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22.5
        button.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.clipsToBounds = true
        return button
    }()

    lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.tintColor = .black
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()

    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        return button
    }()

    lazy var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 22.5
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func buildHierarchy(){
        addSubview(stackView)
        stackView.addArrangedSubview(downloadView)
        stackView.addArrangedSubview(notInterestedView)
        stackView.addArrangedSubview(playView)
        stackView.addArrangedSubview(likeView)
        stackView.addArrangedSubview(moreView)


    }

}
