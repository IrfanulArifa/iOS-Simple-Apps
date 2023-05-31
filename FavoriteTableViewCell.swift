//
//  FavoriteTableViewCell.swift
//  Portal Game
//
//  Created by Irfanul Arifa on 29/05/23.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteRating: UILabel!
    @IBOutlet weak var favoriteReleaseDate: UILabel!
    @IBOutlet weak var favoriteTitle: UILabel!
    @IBOutlet weak var favoriteIndicatorLoading: UIActivityIndicatorView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
