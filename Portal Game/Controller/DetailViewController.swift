//
//  DetailViewController.swift
//  Portal Game
//
//  Created by Irfanul Arifa on 15/05/23.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet weak var detailImage: UIImageView!
  @IBOutlet weak var detailRating: UILabel!
  @IBOutlet weak var detailDescription: UILabel!
  @IBOutlet weak var detailReleaseDate: UILabel!
  @IBOutlet weak var detailTitle: UILabel!
  @IBOutlet weak var favorited: UIBarButtonItem!
  var games: Game? = nil
  override func viewDidLoad() {
    super.viewDidLoad()
    if let result = games {
      detailImage.image = result.image
      detailTitle.text = result.name
      detailReleaseDate.text = "Release Date : \(result.released)"
      detailRating.text = "Rating : \(result.rating)"
      detailDescription.text = result.descriptionRaw
    }
    // Do any additional setup after loading the view.
  }
  @IBAction func addToFavorite(_ sender: UIBarButtonItem) {
    favorited.image = UIImage(named: "heart.fill")
  }
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
}
