//
//  ToDoCellView.swift
//  ToDoUIkit
//
//  Created by Legenda_759 on 09/03/22.
//

import UIKit

class ToDoCellView: BaseView {
    let firstName = UILabel()
    let lastName = UILabel()
    let address = UILabel()
    let email = UILabel()
    let phoneNumber = UILabel()
    let stick = UILabel()
    
    override func embedSubviews() {
        addSubview(firstName)
        addSubview(lastName)
        addSubview(address)
        addSubview(email)
        addSubview(phoneNumber)
        addSubview(stick)
    }
    
    override func initSubviews() {
//        Firstname settings
        firstName.font = UIFont.boldSystemFont(ofSize: 17.0)
        
//        LastName settings
        lastName.font = UIFont.boldSystemFont(ofSize: 17.0)
        
        address.font = UIFont.systemFont(ofSize: 14)
        phoneNumber.font = UIFont.systemFont(ofSize: 14)
        email.font = UIFont.systemFont(ofSize: 14)
        stick.font = UIFont.systemFont(ofSize: 14)
        
//        stick settings
        stick.text = "|"
    }
    
    override func addSubviewsConstraints() {
//        firstName constraints
        firstName.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(10)
        }
        
//        lastName constraints
        lastName.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalTo(firstName.snp.right).offset(10)
        }
        
//        phoneNumber constraints
        phoneNumber.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(firstName.snp.bottom).offset(10)
        }
        
//        stick constraints
        stick.snp.makeConstraints { make in
            make.top.equalTo(firstName.snp.bottom).offset(10)
            make.left.equalTo(phoneNumber.snp.right).offset(2)
        }
        
//        email constraints
        email.snp.makeConstraints { make in
            make.top.equalTo(firstName.snp.bottom).offset(10)
            make.left.equalTo(stick.snp.right).offset(2)
        }
        
//        address constraints
        address.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(phoneNumber.snp.bottom).offset(10)
        }
    }
}
