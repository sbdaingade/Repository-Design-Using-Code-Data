//
//  RecordListViewController.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import UIKit

class RecordListViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate {
    
    @IBOutlet weak var recordsTableView: UITableView!
    private let employeeManager = EmployeeManager()
    private var employees = [Employee]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Records"
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Reload Data", style: .plain, target: self, action: #selector(reloadData))
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.getAllRecords()
        DispatchQueue.main.async { [weak self] in
            self?.recordsTableView.reloadData()
        }
    }
    
    private func getAllRecords() {
        employees = employeeManager.fetchEmployee() ?? []
    }
    
    @objc private func reloadData () {
        print("Reload data")
        self.getAllRecords()
        DispatchQueue.main.async { [weak self] in
            self?.recordsTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! EmployeeRecordCell
        let employee = self.employees[indexPath.row]
       
        cell.name.text = employee.name
        cell.employeeImageView.image = UIImage(data: employee.profilePic!)
        cell.email.text =  employee.email

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employee = self.employees[indexPath.row]
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        detailVC?.selectedEmployee = employee
        self.navigationController?.pushViewController(detailVC!, animated: true)
    
    }
}
