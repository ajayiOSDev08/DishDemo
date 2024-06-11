//
//  ViewController.swift
//  DishDemo
//
//  Created by CEL-MGMT-IT on 11/06/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let viewModel = DishViewModel()
    
    @IBOutlet weak var dishTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        dishTableView.dataSource = self
        dishTableView.delegate = self
        self.fetchDishes()
        self.setupViewModel()
    }
    
    private func fetchDishes() {
        viewModel.fetchDishes()
    }
    
    private func setupViewModel() {
        viewModel.setReloadTableViewClosure { [weak self] in
            DispatchQueue.main.async {
                self?.dishTableView.reloadData()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfDishes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        if let model = viewModel.getDishes(at: indexPath.row) {
            cell.setup(with: model)
            cell.ingredients =  model.nonEmptyIngredients()
        }
        return cell
    }
}

