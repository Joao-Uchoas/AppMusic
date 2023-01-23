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
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.autoresizingMask = .flexibleHeight
        scroll.clipsToBounds = true
        scroll.bounces = false
        return scroll
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
