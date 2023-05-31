//
//  ViewController.swift
//  Portal Game
//
//  Created by Irfanul Arifa on 11/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  private var games : [Game] = []
  @IBOutlet weak var gameTableView: UITableView!
  @IBAction func goToWebsite(_ sender: Any) {
    let url = "https://rawg.io"
    if let url = URL(string: url),UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url)
    }
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return games.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "gameTableViewCell", for: indexPath) as? GameTableViewCell {
      let game = games[indexPath.row]
      cell.gameName.text = game.name
      cell.gameImage.image = game.image
      cell.gameIndicatorLoading.startAnimating()
      cell.gameRating.text = String("Rating \(game.rating)")
      cell.gameDate.text = game.released
      if game.state == .new {
        cell.gameIndicatorLoading.isHidden = false
        cell.gameIndicatorLoading.startAnimating()
        startOperations(game: game, indexPath: indexPath)
      } else {
        cell.gameIndicatorLoading.stopAnimating()
        cell.gameIndicatorLoading.isHidden = true
      }
      return cell
    }
    return UITableViewCell()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    Task {
      await getMovies() }
  }
  func getMovies() async {
    let network = NetworkService()
    do {
      games = try await network.getMovies()
      gameTableView.reloadData()
    } catch {
      fatalError("Error: connection failed.")
    }
    // Do any additional setup after loading the view.
    sleep(3)
    gameTableView.dataSource = self
    gameTableView.delegate = self
    gameTableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gameTableViewCell")
  }
  fileprivate func startOperations(game: Game, indexPath: IndexPath) {
    if game.state == .new {
      startDownload(game: game, indexPath: indexPath)
    }
  }
  fileprivate func startDownload(game: Game, indexPath: IndexPath) {
    let imageDownloader = ImageDownloader()
    if game.state == .new {
      Task {
        do {
          let image = try await imageDownloader.downloadImage(url: game.backgroundImage)
          game.state = .downloaded
          game.image = image
          self.gameTableView.reloadRows(at: [indexPath], with: .automatic)
        } catch {
          game.state = .failed
          game.image = nil
        }
      }
    }
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
}

extension ViewController:UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "moveToDetail", sender: games[indexPath.row])
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "moveToDetail"{
      if let detailViewController = segue.destination as? DetailViewController {
        detailViewController.games = sender as? Game
      }
    }
  }
}
