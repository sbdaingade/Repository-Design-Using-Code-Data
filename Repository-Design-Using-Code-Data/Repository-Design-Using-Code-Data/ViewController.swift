//
//  ViewController.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 12/03/23.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate , UIImagePickerControllerDelegate {
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    
    private let employeeManager = EmployeeManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Create new employee"
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(navigateToListScreen))
        
    }

    @IBAction func pickImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func navigateToListScreen () {
        let employeeListVC = self.storyboard?.instantiateViewController(withIdentifier: "RecordListViewController") as? RecordListViewController
        self.navigationController?.pushViewController(employeeListVC!, animated: true)
    }
    
    
    // MARK: Image picker delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let img = info[.originalImage] as? UIImage
        self.imgProfilePicture.image = img

        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveupdateAction(_ sender: Any) {
        if let name = nameTextField.text, !name.isValidForType(type: .firstName) {
            commonAlertView(withTitle: "Name", message: "Please enter valid name")
            return

        }else if let email = emailTextField.text, !email.isValidForType(type: .email) {
            commonAlertView(withTitle: "Email", message: "Please enter valid email")
            return
        }
        
        let employee = Employee(id:  UUID(), name: nameTextField.text, email: emailTextField.text, profilePic: imgProfilePicture.image?.pngData())
        employeeManager.createEmployee(employee: employee)
    }
    
    
    private func commonAlertView(withTitle title:String , message: String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
