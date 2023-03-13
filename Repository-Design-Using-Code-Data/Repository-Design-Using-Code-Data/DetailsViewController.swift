//
//  DetailsViewController.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import UIKit

class DetailsViewController: UIViewController,UINavigationControllerDelegate , UIImagePickerControllerDelegate {

    @IBOutlet weak var imgProfilePicture: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    private let manager = EmployeeManager()
    var selectedEmployee: Employee? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillSetUp()
        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteRecord))

    }
    
    
    @objc private func deleteRecord () {
        
        if let newID = selectedEmployee?.id {
            let alert = UIAlertController(title: "Delete", message: "Are you sure to delete", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {[weak self] _ in
                if ((self?.manager.deleteEmployee(id: newID)) != nil) {
                    _ = self?.navigationController?.popViewController(animated: true)                }
                
            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            commonAlertView(withTitle: "Error", message: "Can not do this opearation for the now")
        }
    }
    
    
    @IBAction func pickImageAction(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }
    
    // MARK: Image picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[.originalImage] as? UIImage
        self.imgProfilePicture.image = img

        dismiss(animated: true, completion: nil)
    }
    
    func viewWillSetUp()  {
        
        self.nameTextField.text = selectedEmployee?.name
        self.emailTextField.text = selectedEmployee?.email
        self.imgProfilePicture.image = UIImage(data: (selectedEmployee?.profilePic)!)
    }

    @IBAction func updateAction(_ sender: Any) {
        
        if let name = nameTextField.text, !name.isValidForType(type: .firstName) {
            commonAlertView(withTitle: "Name", message: "Please enter valid name")
            return
            
        }else if let email = emailTextField.text, !email.isValidForType(type: .email) {
            commonAlertView(withTitle: "Email", message: "Please enter valid email")
            return
        }
        
        let employee = Employee(id:  selectedEmployee!.id, name: nameTextField.text, email: emailTextField.text, profilePic: imgProfilePicture.image?.pngData())
        
        if manager.updateEmployee(employee: employee) {
            
            let alert = UIAlertController(title: "Successfully", message: "Record updated successfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {[weak self] _ in
                
                self?.navigationController?.popViewController(animated: true)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }else {
            commonAlertView(withTitle: "", message: "Please try again")
        }
        
    }
    
    
    private func commonAlertView(withTitle title:String , message: String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
