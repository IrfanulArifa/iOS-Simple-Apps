//
//  FavoriteViewController.swift
//  Portal Game
//
//  Created by Irfanul Arifa on 30/05/23.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource {
  private var favorites : [Favorite] = []
  @IBOutlet weak var favoriteTableView: UITableView!
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteTableViewCell", for: indexPath) as? FavoriteTableViewCell{
      if 1 == 1 {
      } else {
      }
      return cell
    }
    return UITableViewCell()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    favoriteTableView.dataSource = self
    // Do any additional setup after loading the view.
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
