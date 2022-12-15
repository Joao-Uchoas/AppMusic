//
//  CustomCardView.swift
//  AppMusic
//
//  Created by Uchoas Santos, Joao Vitor on 13/12/22.
//

import UIKit

enum Status {
    case full
    case card
}

class CustomCardView: UIView {

    //MARK: - Propriedades

    var status: Status?
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
    var containerTopConstraints: NSLayoutConstraint?
    var dataModel: CardViewModel?

    //MARK: - Elements

    //view do card
    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false // desligamento de constraints automaticas
        view.layer.cornerRadius = 30 //borda da view
        view.clipsToBounds = true // tem que ser igual a true para poder arrendondar as bordas
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0.0, height: -2.0)
        view.layer.shadowRadius = 20

        return view
    }()

    //imagem do card
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        return image
    }()

    //view que escurece o card
    lazy var overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return view
    }()


    //borda da imagem do usuario
    lazy var borderImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        return view
    }()

    //imagem do perfil do usuario
    lazy var imageProfileView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()

    //botao para adicionar uma nova imagem de perfil (botao plus '+')
    lazy var addProfileImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    //categoria de musica
    lazy var categoryCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()

    //data da categoria de musica
    lazy var dateCategoryCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        return label
    }()

    //titulo do card
    lazy var titleCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 31, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    //like and time
    lazy var likeAndTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    //MARK: - Inicializador

    init() {
        let frame = CGRect.zero
        super.init(frame: frame)
        hierarchyConfiguration()
//        self.setupLayout(for: self.status ?? .card)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Hierarquia

    private func hierarchyConfiguration() {
        self.addSubview(cardContainerView)
        self.cardContainerView.addSubview(self.imageView)
        self.cardContainerView.addSubview(self.overlayView)
        self.cardContainerView.addSubview(self.borderImageView)
        self.cardContainerView.addSubview(self.imageProfileView)
        self.cardContainerView.addSubview(self.addProfileImageButton)
        self.cardContainerView.addSubview(self.categoryCardLabel)
        self.cardContainerView.addSubview(self.dateCategoryCardLabel)
        self.cardContainerView.addSubview(self.titleCardLabel)
        self.cardContainerView.addSubview(self.likeAndTimeLabel)
        self.cardContainerView.addSubview(self.descriptionLabel)
        self.setupLayout(for: self.status ?? .card)
    }

    //MARK: - Setups
    private func setupLayout(for status: Status){
        switch status {
        case .full:
            containerTopConstraints?.constant = 0
            containerBottomConstraints?.constant = 0
            containerLeadingConstraints?.constant = 0
            containerTrailingConstraints?.constant = 0
            descriptionLabel.isHidden = false
        case .card:
            containerTopConstraints?.constant = 15
            containerBottomConstraints?.constant = -15
            containerLeadingConstraints?.constant = 30
            containerTrailingConstraints?.constant = -30
            descriptionLabel.isHidden = true
        }
    }

    private func setupConstraints() {

        containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        containerLeadingConstraints?.isActive = true

        containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        containerTopConstraints?.isActive = true

        containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        containerBottomConstraints?.isActive = true

        containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        containerTrailingConstraints?.isActive = true

        self.overlayView.pin(to: self.cardContainerView)
        self.imageView.pin(to: self.cardContainerView)

        NSLayoutConstraint.activate([
            borderImageView.topAnchor.constraint(equalTo: cardContainerView.topAnchor, constant: 60),
            borderImageView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            borderImageView.widthAnchor.constraint(equalToConstant: 50),
            borderImageView.heightAnchor.constraint(equalToConstant: 50),

            addProfileImageButton.trailingAnchor.constraint(equalTo: borderImageView.trailingAnchor, constant: 4),
            addProfileImageButton.bottomAnchor.constraint(equalTo: borderImageView.bottomAnchor, constant: 4),
            addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),

            imageProfileView.centerXAnchor.constraint(equalTo: borderImageView.centerXAnchor),
            imageProfileView.centerYAnchor.constraint(equalTo: borderImageView.centerYAnchor),
            imageProfileView.widthAnchor.constraint(equalToConstant: 40),
            imageProfileView.heightAnchor.constraint(equalToConstant: 40),

            categoryCardLabel.topAnchor.constraint(equalTo: borderImageView.bottomAnchor, constant: 10),
            categoryCardLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),

            dateCategoryCardLabel.topAnchor.constraint(equalTo: categoryCardLabel.bottomAnchor, constant: 2),
            dateCategoryCardLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),

            titleCardLabel.topAnchor.constraint(equalTo: dateCategoryCardLabel.bottomAnchor, constant: 20),
            titleCardLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 20),
            titleCardLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -20),

            likeAndTimeLabel.topAnchor.constraint(equalTo: titleCardLabel.bottomAnchor, constant: 10),
            likeAndTimeLabel.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: likeAndTimeLabel.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardContainerView.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardContainerView.trailingAnchor, constant: -40)
        ])
    }

    public func setupView(data: CardViewModel) {
        self.categoryCardLabel.text = data.categoryName
        self.dateCategoryCardLabel.text = data.categoryDate
        self.titleCardLabel.text = data.cardTitle
        self.likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        self.descriptionLabel.text = data.cardDescription
        self.imageView.image = UIImage(named: data.cardImage ?? "")
        self.imageProfileView.image = UIImage(named: data.categoryImage ?? "")

    }



}
