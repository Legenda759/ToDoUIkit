//
//  BaseView.swift
//  ToDoUIkit
//
//  Created by Legenda_759 on 09/03/22.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        initSubviews()
        embedSubviews()
        addSubviewsConstraints()
    }
    
    func initSubviews() {
        //fatalError("Implementation pending...")
    }
    
    func embedSubviews() {
        //fatalError("Implementation pending...")
    }
    
    func addSubviewsConstraints() {
        //fatalError("Implementation pending...")
    }
    
}
