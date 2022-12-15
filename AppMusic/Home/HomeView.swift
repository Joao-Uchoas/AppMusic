//
//  HomeView.swift
//  AppMusic
//
//  Created by Uchoas Santos, Joao Vitor on 13/12/22.
//

import UIKit

class HomeView: UIView {

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.separatorStyle = .none
        view.tableFooterView = UIView()
        view.showsVerticalScrollIndicator = false
        view.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(self.tableView)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        self.tableView.pin(to: self)
    }

}

extension HomeView {
    class Cell: UITableViewCell {
        static let identifier: String = "HomeViewCell"

        lazy var cardView: CustomCardView = {
            let view = CustomCardView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.clipsToBounds = true // permite colocar as bordas, quando tiver true
            return view
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.setupView()
            self.setupConstraints()
            self.selectionStyle = .none
        }

        public func setupCell(data: CardViewModel) {
            self.cardView.setupView(data: data)

        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


        fileprivate func setupView(){
            self.contentView.addSubview(self.cardView)
        }

        fileprivate func setupConstraints(){
            self.cardView.pin(to: self)
        }

    }

}
