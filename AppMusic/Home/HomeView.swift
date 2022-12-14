//
//  HomeView.swift
//  AppMusicBF
//
//  Created by Uchoas Santos, Joao Vitor on 13/12/22.
//

import UIKit

class HomeView: UIView {

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false

        return tv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
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
        static let identifier: String = "HomeView.Cell"

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

}
