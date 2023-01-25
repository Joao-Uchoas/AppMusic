//
//  DetailsView.swift
//  AppMusic
//
//  Created by Uchoas Santos, Joao Vitor on 20/12/22.
//

import UIKit

class DetailsView: UIView {

    var cardMode: CardViewModel?


    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.autoresizingMask = .flexibleHeight
        scroll.clipsToBounds = true
        scroll.bounces = false
        return scroll
    }()

    lazy var cardView: CustomCardView = {
        let view = CustomCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionView.updateLayout(for: .full)
        view.cardContainerView.layer.cornerRadius = 0.0
        view.setupView(data: self.cardMode ?? CardViewModel())
        return view
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableFooterView = UIView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return table
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.addTarget(self, action: #selector(closeTap), for: .touchUpInside)
        return button
    }()

    @objc
    func closeTap(){
        print("Ola amiguinhos.`")
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
