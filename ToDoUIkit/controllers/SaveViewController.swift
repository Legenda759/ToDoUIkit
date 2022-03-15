//
//  SaveViewController.swift
//  ToDoUIkit
//
//  Created by Legenda_759 on 10/03/22.
//

import UIKit
import SnapKit

class SaveViewController: UIViewController {

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let textField4 = UITextField()
    let textField5 = UITextField()
    let saveButton = UIButton()
    var complete: ()->() = {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Create"
        
        view.addSubview(textField1)
        view.addSubview(textField2)
        view.addSubview(textField3)
        view.addSubview(textField4)
        view.addSubview(textField5)
        
        textField1.placeholder = "First Name"
        textField1.borderStyle = .roundedRect
        
        textField2.placeholder = "Last Name"
        textField2.borderStyle = .roundedRect
        
        textField3.placeholder = "Phone Number"
        textField3.borderStyle = .roundedRect
        
        textField4.placeholder = "Email"
        textField4.borderStyle = .roundedRect
        
        textField5.placeholder = "Address"
        textField5.borderStyle = .roundedRect
        
        textField1.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        
        textField3.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        
        textField4.snp.makeConstraints { make in
            make.top.equalTo(textField3.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        
        textField5.snp.makeConstraints { make in
            make.top.equalTo(textField4.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        
        saveButton.setTitle("Create", for: .normal)
        saveButton.tintColor = .white
        saveButton.backgroundColor = . blue
        saveButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
        
        view.addSubview(saveButton)
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(textField5.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(10)
            make.height.equalTo(45)
        }
        
    }
    
    //    MARK: - Core Data
        
        
        
        func createItem(firstName: String, lastName: String, address: String, email: String, phoneNumber: String) {
            let newItem = ToDoListItem(context: context)
            newItem.firstName = firstName
            newItem.lastName = lastName
            newItem.address = address
            newItem.email = email
            newItem.phoneNumber = phoneNumber
            
            do {
                try context.save()
                dismiss(animated: true) {
                    self.complete()
                }
                //getAllItems()
            }catch {
    //            error
            }
        }
        
        func deleteItem(item: ToDoListItem) {
            context.delete(item)
            
            do {
                try context.save()
            }catch {
    //            error
            }
        }
        
        func updateItem(item: ToDoListItem, newFirstName: String, newLastName: String, newAddress: String, newEmail: String, newPhoneNumber: String) {
            item.firstName = newFirstName
            item.lastName = newLastName
            item.address = newAddress
            item.email = newEmail
            item.phoneNumber = newPhoneNumber
            
            do {
                try context.save()
            }catch {
    //            error
            }
        }
    
    @objc func createButtonTapped() {
        if !textField1.text!.isEmpty && !textField2.text!.isEmpty && !textField3.text!.isEmpty && !textField4.text!.isEmpty && !textField5.text!.isEmpty {
            createItem(firstName: textField1.text!, lastName: textField2.text!, address: textField5.text!, email: textField4.text!, phoneNumber: textField3.text!)
        }
    }
    
}
