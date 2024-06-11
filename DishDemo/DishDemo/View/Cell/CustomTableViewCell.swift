//
//  CustomTableViewCell.swift
//  DishDemo
//
//  Created by CEL-MGMT-IT on 11/06/24.
//

import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var dishLabel: UILabel!
    
    @IBOutlet weak var dishType: UIView!
    
    @IBOutlet weak var dishInstructionTextView: UITextView!
    
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    static let identifier = "CustomTableViewCell"
    
    var ingredients: [String] = [] {
        didSet {
            customCollectionView.reloadData()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dishImageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
    }


    func setup(with model: Dish) {
        configureUI()
        configureLabels(with: model)
        configureImageView(with: model.strMealThumb)
    }
    
    private func configureUI() {
        cardView.layer.cornerRadius = 10
        cardView.layer.masksToBounds = true
        
        dishType.layer.cornerRadius = dishType.frame.width / 2
        dishType.layer.masksToBounds = true
    }

    
    private func configureLabels(with model: Dish) {
        dishLabel.text = model.strMeal
        dishInstructionTextView.text = model.strInstructions
    }
    
    private func configureImageView(with imageUrl: String?) {
        guard let imageUrl = imageUrl, let url = URL(string: imageUrl) else {
            dishImageView.image = UIImage(named: "default_thumb")
            return
        }
        dishImageView.kf.setImage(with: url)
    }
}

extension CustomTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        let item = ingredients[indexPath.item]
        cell.imageView.image = UIImage(named: "default_thumb")
        cell.ingredientLabel.text = item
        return cell
    }
    
    
}
