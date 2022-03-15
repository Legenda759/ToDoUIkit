//
//  ToDoTableViewCell.swift
//  ToDoUIkit
//
//  Created by Legenda_759 on 09/03/22.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    let viewcha = ToDoCellView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(viewcha)
        viewcha.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide)
            make.right.equalTo(safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(0)
        }
    }

    func reload(item: ToDoListItem) {
        viewcha.firstName.text = item.firstName
        viewcha.lastName.text = item.lastName
        viewcha.address.text = item.address
        viewcha.email.text = item.email
        viewcha.phoneNumber.text = item.phoneNumber
    }
    
}
