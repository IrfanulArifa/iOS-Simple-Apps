//
//  GameTableViewCell.swift
//  Portal Game
//
//  Created by Irfanul Arifa on 11/05/23.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameIndicatorLoading: UIActivityIndicatorView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameDate: UILabel!
    @IBOutlet weak var gameRating: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
