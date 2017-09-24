//
//  RecipeTableViewCell.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelRecipeTitle: UILabel!
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    @IBOutlet weak var labelRecipeIngredients: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRecipeData(recipe:Recipe){
        if let title = recipe.title {
            labelRecipeTitle.text = "\(title)"
        }
        
        if let ingredients = recipe.ingredients {
            labelRecipeIngredients.text = "\(ingredients)"
        }
        
        if let thumnailImage = recipe.thumbnail {
            DispatchQueue.main.async {
                // set corner radius
                self.imageViewThumbnail.setCornerRadius(value: self.imageViewThumbnail.frame.size.width/2)
                self.imageViewThumbnail.sd_setImage(with: URL(string:"\(thumnailImage)"), completed: nil)
            }
        }
        
    }
    
}
